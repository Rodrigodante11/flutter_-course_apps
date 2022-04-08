
import 'package:atm_consultoria/TelaCliente.dart';
import 'package:atm_consultoria/TelaContato.dart';
import 'package:atm_consultoria/TelaEmpresa.dart';
import 'package:atm_consultoria/TelaServico.dart';
import 'package:flutter/material.dart';

class TelaPrinciapl extends StatefulWidget {
  const TelaPrinciapl({Key? key}) : super(key: key);

  @override
  State<TelaPrinciapl> createState() => _TelaPrinciaplState();
}

class _TelaPrinciaplState extends State<TelaPrinciapl> {

  void _abrirEmpresa(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaEmpresa()));
  }

  void _abrirServico(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaServico()));
  }

  void _abrirCliente(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaCliente()));
  }

  void _abrirContato(){
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaContato()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("ATM Consutoria"),
          backgroundColor: Colors.green,
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Image(image: AssetImage("images/logo.png")),
              Padding(
                padding: EdgeInsets.only(top:32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // alinhar a linha
                  children: <Widget>[
                    GestureDetector(
                      onTap: _abrirEmpresa , // ao clicar na imagem
                      child: Image.asset("images/menu_empresa.png"),
                    ),
                    GestureDetector(
                      onTap: _abrirServico , // ao clicar na imagem
                      child: Image.asset("images/menu_servico.png"),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, // alinhar a linha
                  children: <Widget>[
                    GestureDetector(
                      onTap: _abrirCliente , // ao clicar na imagem
                      child: Image.asset("images/menu_cliente.png"),
                    ),
                    GestureDetector(
                      onTap: _abrirContato , // ao clicar na imagem
                      child: Image.asset("images/menu_contato.png"),
                    )
                  ],
                ),
              )
            ],
          ),
        )











        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: <Widget>[
        //     Padding(
        //         padding: EdgeInsets.only(left: 200 , right: 200, top: 80)
        //     ),
        //     Image(image: AssetImage("images/logo.png")),

        //     Row(
        //       crossAxisAlignment: CrossAxisAlignment.center,
        //       children: [
        //         Padding(
        //             padding: EdgeInsets.only(left: 70,top: 160)
        //         ),
        //         Image(image: AssetImage("images/menu_cliente.png")),
        //
        //         Padding(
        //             padding: EdgeInsets.only(left: 40, top: 140)
        //         ),
        //         Image(image: AssetImage("images/menu_contato.png")),
        //       ],
        //     )
        //   ],
        // )
    );
  }
}


