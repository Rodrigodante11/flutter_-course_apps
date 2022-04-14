import 'package:http/http.dart' as http;
import 'dart:convert';

const CHAVE_YOUTUBE_API = "AIzaSyC7eiEcVOyGnEo4XK_rn8xt-K4fUesrJwM";
const ID_CANAL = "UCPWBlX15fNBUw0cLqKM-V7g";
const URL_BASE = "GET https://www.googleapis.com/youtube/v3/";

class Api {

  pesquisar(String pesquisa) async{
    http.Response response = await http.get(
        URL_BASE + "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa"
    );

    if( response.statusCode ==200){

      Map<String, dynamic> dadosJson = json.decode(response.body);

    }else{

    }
  }
}