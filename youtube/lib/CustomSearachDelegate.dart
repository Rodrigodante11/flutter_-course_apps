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
            close(context,"",);
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
    List<String> lista = [];
    if( query.isNotEmpty){
      lista = [
        "Jawsh 685", "Music Mix 2022 Remixes", "Techno Hands up", "Music Mix 2022 | Best"
      ].where(
        (texto)=> texto.toLowerCase().startsWith(query.toLowerCase())
      ).toList();

      return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context,index){
          return ListTile(
            onTap: (){
              close(context, lista[index]);
            },
            title: Text(lista[index]),
          );
        },
      );
    }else{
      return Center(
        child: Text("Nenhum resultado para a pesquisa!"),
      );
    }

  }
  
}