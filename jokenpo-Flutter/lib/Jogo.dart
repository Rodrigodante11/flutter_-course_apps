import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp =  AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opcao abaixo";

  void _opcaoSelecionada(String escolhaUsuario){

    var opcoes = ["pedra" , "papel" , "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    switch( escolhaApp ){  //imagem escolhida pelo APP
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;

      case "papel":
        setState(() {
          _imagemApp = AssetImage("images/papel.png");
        });
        break;

      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    //validacao do ganhador
    if(
    (escolhaUsuario =="pedra" && escolhaApp =="tesoura") ||
        (escolhaUsuario =="tesoura" && escolhaApp =="papel") ||
            (escolhaUsuario =="papel" && escolhaApp =="pedra") ){

        setState(() {
          this._mensagem = "PARABENS!!! VOCE GANHOOU!!";
        });
    }else if(
    (escolhaUsuario =="tesoura" && escolhaApp =="pedra") ||
        (escolhaUsuario =="papel" && escolhaApp =="tesoura") ||
        (escolhaUsuario =="pedra" && escolhaApp =="papel")
    ){
      setState(() {
        this._mensagem = "Voce Perdeeeu!!";
      });
    }else{
      setState(() {
        this._mensagem = "Empateeeee!!";
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("JOKENPO"),
        centerTitle: true,

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top:32, bottom: 16),
              child: Text(
                "Escolha do App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )
              )
          ),
          Image(image: this._imagemApp),
          Padding(
              padding: EdgeInsets.only(top:32, bottom: 16),
              child: Text(
                  this._mensagem,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  )
              )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("images/pedra.png", height: 120),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("images/papel.png", height: 120),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("images/tesoura.png", height: 120),
              ),
              // Image.asset("images/pedra.png", height: 120),
              // Image.asset("images/papel.png", height: 120),
              // Image.asset("images/tesoura.png", height: 120),

            ],
          )
        ],
      ) ,
    );
  }
}
