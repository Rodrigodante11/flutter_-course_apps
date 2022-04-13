import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData( // cor e opacidade de todos os icones
          color: Colors.grey,
          opacity:0.8
        ),
        title: Image.asset(
            "images/youtube.png",
             width: 98,
             height: 22,
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.videocam)
          ),
          IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.search)
          ),
          IconButton(
              onPressed: (){

              },
              icon: Icon(Icons.account_circle)
          )
        ],
      ),
      body: Container(),
    );
  }
}
