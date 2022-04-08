
import 'package:flutter/material.dart';

class TelaContato extends StatefulWidget {
  const TelaContato({Key? key}) : super(key: key);

  @override
  State<TelaContato> createState() => _TelaContatoState();
}

class _TelaContatoState extends State<TelaContato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Contato"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView( // para ter a opcao de rolagem no app
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget> [
                  Image.asset("images/detalhe_contato.png"),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                        "Contato",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black
                        )
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top:16),
                child: Text(
                    "atendimento@atmConsultoria.com.br"
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:16),
                child: Text(
                    "Telefone: (35) 99889-9889"
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:16),
                child: Text(
                    "Celular: (35) 7878-7878"
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
