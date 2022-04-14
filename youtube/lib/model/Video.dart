class Video {
  late String? id;
  late String? titulo;
  late String? descricao ;
  late String? imagem;
  late String? canal;

  Video( {this.id,  this.titulo,  this.descricao, this.imagem, this.canal});

//  static converterJson(Map<String, dynamic> json) {
//    return Video(
//      id: json["id"]["videoId"],
//      titulo: json["snippet"]["title"],
//      imagem: json["snippet"]["thumbnails"]["high"]["url"],
//      canal: json["snippet"]["channelId"],
//
//    );
//  }
  factory Video.fromJson( Map<String, dynamic> json){
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelId"],
    );
  }


}