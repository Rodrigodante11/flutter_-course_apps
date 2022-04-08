
import 'dart:math';
import 'package:cara_ou_coroa/Resultado.dart';
import 'package:flutter/material.dart';

class Jogar extends StatefulWidget {
  const Jogar({Key? key}) : super(key: key);

  @override
  State<Jogar> createState() => _JogarState();
}

class _JogarState extends State<Jogar> {

  void _exibirResultado(){

    var itens = ["cara" , "coroa"];
    var num = Random().nextInt(itens.length);
    var resultadoGerado = itens[num];

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Resultado(resultadoGerado)
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff61bd86),
      //   backgroundColor: Color.fromRGBO(255, 204, 128, 1),
      body:  Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset("images/logo.png"),
            GestureDetector(
              onTap: _exibirResultado,
              child: Image.asset("images/botao_jogar.png")
            )
          ],
        )
      )
    );
  }
}
