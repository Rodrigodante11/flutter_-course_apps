import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


// Usando o padrao singleton de classes
// Esse padrao so retorna uma unica instanbcia idependente de quantas instancia
// seja feita
// normalmenete utilizado em classes que manipula
// banco de dados ja que bd so precisa de uma unica instancia
class AnotacaoHelper {

  static final AnotacaoHelper _anotacaoHelper = AnotacaoHelper._internal();
  Database _db;

  factory AnotacaoHelper(){
    return _anotacaoHelper;
  }

  AnotacaoHelper._internal(){

  }

  get db async {
    if (db != null) {
      return _db;
    } else {

    }
  }

  _onCreate(Databasedb, int version ) async{
    String sql= "CREATE TABLE anotacao(id INTEGER PRIMARY KEY AUTOINCREMENT, "
        "titulo VARCHAR,"
        "descricao TEXT,"
        "data DATETIME)";
    
    await db.execute(sql);
  }
  inicializarDb() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(
        caminhoBancoDados, "banco_minhas_anotacoes.db");
      
    var db = await openDatabase(
        localBancoDados,
        version: 1 ,
        onCreate: _onCreate);
    }


}