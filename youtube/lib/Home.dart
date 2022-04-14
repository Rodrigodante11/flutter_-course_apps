import 'package:flutter/material.dart';
import 'package:youtube/CustomSearachDelegate.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricao.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: Colors.grey
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
          "images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: ()async{
              String? res = await showSearch(
                  context: context,
                  delegate:CustomSearchDelegate() ,
              );
              setState(() {
                _resultado = res!;
              });
              //print(res);
            },
          ),
          /*IconButton(
            icon: Icon(Icons.videocam),
            onPressed: (){
              print("acao: videocam");
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){
              print("acao: conta");
            },
          )*/
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _indiceAtual,
          onTap: (indice){
            setState(() {
              _indiceAtual = indice; // pega o click do usuario para mudar a cor do icone
            });
          },
          type: BottomNavigationBarType.fixed, //fixed > 3 BottomNavigationBarItem()
          fixedColor: Colors.red,              //shifting <=3 BottomNavigationBarItem()
          items: [
            BottomNavigationBarItem(
              //backgroundColor: Colors.orange,
                icon: Icon(Icons.home),
                label: "Inicio"
               // label: Text("Início")
            ),
            BottomNavigationBarItem(
              //backgroundColor: Colors.red,
              //title: Text("Em alta"),
                icon: Icon(Icons.whatshot),
                label: "Em Alta"
            ),
            BottomNavigationBarItem(
              //backgroundColor: Colors.blue,
              //title: Text("Inscrições"),
                icon: Icon(Icons.subscriptions),
                label: "Inscrições"
            ),
            BottomNavigationBarItem(
              //backgroundColor: Colors.green,
              //title: Text("Biblioteca"),
                icon: Icon(Icons.folder),
                label: "Biblioteca"
            ),
          ]
      ),
    );
  }
}
