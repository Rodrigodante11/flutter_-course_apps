
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';




class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _listaTarefa = [] ;
  TextEditingController _controller = TextEditingController();

  Future<File>  _getFile() async{
    var diretorio = await getApplicationDocumentsDirectory(); // pegando o caminho
    return File( "${diretorio.path}/dados.json" );
  }

  _salvarAquivo() async  {

    var arquivo = await _getFile();

    String dados = json.encode(_listaTarefa); // transformando em json
    arquivo.writeAsString(dados);

  }
  _salvarTarefa() {

    String textoDigitado = _controller.text;

    //criar os dados
    Map<String, dynamic> tarefa = Map();
    tarefa['titulo'] = textoDigitado;
    tarefa['realizada'] = false;

    setState(() {
      _listaTarefa.add(tarefa);
    });

    _salvarAquivo();
    _controller.text = "Digite o titulo" ; // zerando o field

  }

  _lerarquivo() async {

    try{

      final arquivo = await _getFile();
      return arquivo.readAsString();

    }catch(e){
      return null;
    }

  }
  @override
  void initState() { // carrega antes do build

    super.initState();

    _lerarquivo().then( (dados ) {
      setState(() {
        _listaTarefa = json.decode(dados); // recuperando os dados no arquivo ao iniciar o app
      });
    });
  }

  Widget criarItemLista(context,index){

    final item = _listaTarefa[index]["titulo"] ;

    return Dismissible(
        key: Key(item), // para nao criar igual
        direction: DismissDirection.endToStart,
        onDismissed: (direction){
          _listaTarefa.removeAt(index);
          _salvarAquivo();
        },
        background: Container(
          color: Colors.red,
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget> [
              Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ],
          ),
        ),
        child: CheckboxListTile(
            title: Text(_listaTarefa[index]["titulo"]),
            value: _listaTarefa[index]["realizada"],
            onChanged: (valorAlterado){
              setState(() {
                _listaTarefa[index]["realizada"] = valorAlterado;
              });
              _salvarAquivo();
            }
        ),
    );

  }

  @override
  Widget build(BuildContext context) {

    //_salvarAquivo();
    print("itens: " + _listaTarefa.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de tarefas"),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
        onPressed: (){

          showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  title: Text("Adicionar tarefa"),
                  content: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      labelText: "Digite sua Tarefa"
                    ),
                    onChanged: (text){

                    },
                  ),
                  actions: <Widget> [
                    TextButton(
                        onPressed: ()=>Navigator.pop(context),
                        child: Text("Cancelar")
                    ),
                    TextButton(
                        onPressed: (){
                          _salvarTarefa();
                          Navigator.pop(context);
                        },
                        child: Text("Salvar")
                    )
                  ],
                );
              }
          );
        },
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                itemCount: _listaTarefa.length,
                  itemBuilder: criarItemLista

              )
          )
        ],
      ),
    );
  }

}
