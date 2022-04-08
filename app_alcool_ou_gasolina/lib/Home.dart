import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  String _textoResultado = "";

  void _calcular(){

    double? precoAlcool = double.tryParse(
        _controllerAlcool.text.replaceAll(",", "."));
    double? precoGasolina = double.tryParse(
        _controllerGasolina.text.replaceAll(",", "."));

    if( precoAlcool == null || precoGasolina == null){
      setState(() {
        _textoResultado = "Numero invalido, digite numeros maiores que 0 ";
      });
    }else{
      if(precoAlcool / precoGasolina >= 0.7){
        setState(() {
          _textoResultado = "Melhor abastecer com Gasolina";
        });
      }else{
        setState(() {
          _textoResultado = "Melhor abastecer com Alcool";
        });
      }
      _limparCampos();
    }
  }
  void _limparCampos(){

    // _controllerAlcool.text="";
    // _controllerGasolina.text="";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("alcool ou Gasolina"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SingleChildScrollView( // tudo dentro SingleChildScrollView para poder rolar pelo app
          padding: EdgeInsets.all(32), // expacamento laterais
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // botao ocupando a gtela
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("images/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abstecimento do seu carro",
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço alcool, ex: 1.59"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerAlcool ,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Gasolina, ex: 3.59"
                ),
                style: TextStyle(
                    fontSize: 22
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: ElevatedButton(
                  onPressed: _calcular,
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                      padding: EdgeInsets.all(15)
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  _textoResultado,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],
          ),
        )
      )
    );
  }
}
