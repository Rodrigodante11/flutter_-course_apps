
import 'package:flutter/material.dart';
import 'package:youtube/api.dart';
import 'package:youtube/model/Video.dart';
import 'package:youtube/video_screen.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Inicio extends StatefulWidget {

  String pesquisa;
  Inicio(this.pesquisa);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _listarVideos(String pesquisa){

    Api api = Api();
    return api.pesquisar(pesquisa);

  }

  @override
  Widget build(BuildContext context) {


    return FutureBuilder<List<Video>>(
      future: _listarVideos(widget.pesquisa),
        builder: (contex, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              // break;
            case ConnectionState.active:
            case ConnectionState.done:
              if( snapshot.hasData){

                return ListView.separated(
                    itemBuilder: (contex, index){
                      List<Video>? videos = snapshot.data;
                      Video video =videos![index];

                      return GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => VideoScreen(id: video.id),
                          )
                        );
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit:BoxFit.cover,
                                image: NetworkImage(video.imagem.toString())
                              )
                            ),
                          ),
                          ListTile(
                            title: Text(video.titulo.toString()),
                            subtitle: Text(video.descricao.toString()),
                          )
                        ],
                      )
                      );
                    },
                    separatorBuilder: (contex, index)=> Divider(
                      height: 2,
                        color: Colors.red,
                    ),
                    itemCount: snapshot.data!.length
                );
              }else{
                return Center(
                    child: Text("Nenhum dado a ser exibido!"),
                );
              }
              // break;

          }
        }
    );
  }
}
