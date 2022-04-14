import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:youtube/model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyC7eiEcVOyGnEo4XK_rn8xt-K4fUesrJwM";
const ID_CANAL = "UCPWBlX15fNBUw0cLqKM-V7g";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {

  Future<List<Video>> pesquisar(String pesquisa) async{

    http.Response response = await http.get(
      Uri.parse(
        URL_BASE + "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa"
      )
    );

    if( response.statusCode ==200){

      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>( // percorer cada "item" com apenas uma unica instancia(video 1, video 2 , video 3 ...)
          (map){
            return Video.fromJson(map);
            //return Video.converterJson(map);
          }
      ).toList();

      return videos;

//    for( var video in dadosJson["items"]){
//      print("resultado: "+ video.toString());
//    }

    }else{

      print("resultado api erro" );
      List<Video> videos= Video() as List<Video> ;
      return videos;
    }
  }
}