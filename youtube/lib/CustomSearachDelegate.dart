import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String>{
  @override
  List<Widget>? buildActions(BuildContext context) {

    return [
      IconButton(
          onPressed: (){
            query= "";
          },
          icon: Icon(Icons.clear)
      ),
//      IconButton(
//          onPressed: (){
//
//          },
//          icon: Icon(Icons.done)
//      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return
      IconButton(
          onPressed: (){
            close(
                context,
                "",
            );
          },
          icon: Icon(Icons.arrow_back)
      );
  }

  @override
  Widget buildResults(BuildContext context) { // quando o usuario faz a pesquisa
    //print("pesquisa realizada");
    close(context,query); // query == o que o usuario digito
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) { // chamado toda vez que o usuario digita algo
    //print("pesquisa realizada " +query);
    return Container();
  }
  
}