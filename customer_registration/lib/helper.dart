// importação dos arquivos
// ignore_for_file: unused_import

import 'dart:io'; // gravação de arquivos
import 'package:path/path.dart'; // manipulação de caminhos
import 'package:path_provider/path_provider.dart'; // provedor de caminhos
import 'package:sqflite/sqflite.dart'; // banco de dados

// classe principal da conexão com o banco de dados
class DatabaseHelper {
  // variáveis globais do banco de dados
  static const _databaseName = 'sqliteDB.db'; // nome do banco de dados
  static const _databaseVersion = 1; // versão do banco de dados

  // variável para a tabela
  static const tableUsu = 'usuarios'; // nome da tabela
  static const tableCli = 'clientes'; // nome da tabela

  // variáveis para os campos da tabela
  static const columnUsuId = '_id';
  static const columnUsuEmail = 'usuario';
  static const columnUsu = 'usuario';
  static const columnUsuSenha = 'senha';

  static const columnCliId = '_id';
  static const columnCliNome = 'nome';
  static const columnCliEmail = 'email';
  static const columnCliRg = 'rg';
  static const columnCliCpf = 'cpf';
  static const columnCliCep = 'cep';

  // design pattern para conexões no modo Singleton
  DatabaseHelper._privateConstructor();

  // criação de uma variável para a instância do banco de dados
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // referência única para o banco de dados
  // nesse ponto, verificamos se o banco existe físicamente
  // a ? diz que a variável aceita valores nulos
  static Database _database;

  Future<Database> get database async {
    // se o banco de dados não existir, ele será criado
    if (_database != null) return _database;
    // se o banco de dados existir, ele será retornado
    _database = await _initDatabase();
    return _database;
  }

  // método initDatabase()
  _initDatabase() async {
    // verificar o caminho físico do banco e se há permissão de abertura
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);

    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // método que cria um novo banco de dados e tabelas, caso não exista
  Future _onCreate(Database db, int version) async {
    await db.execute(
        '''
        CREATE TABLE $tableUsu (
          $columnUsuId INTEGER PRIMARY KEY,
          $columnUsuEmail TEXT NOT NULL,
          $columnUsu TEXT NOT NULL,
          $columnUsuSenha INTEGER NOT NULL
        );

        CREATE TABLE $tableCli (
          $columnCliId INTEGER PRIMARY KEY,
          $columnCliNome TEXT NOT NULL,
          $columnCliEmail TEXT NOT NULL,
          $columnCliRg TEXT NOT NULL,
          $columnCliCpf TEXT NOT NULL,
          $columnCliCep TEXT NOT NULL
        );
      ''');
  }

  // métodos do CRUD
  // método de inclusão de dados
  // insere uma linha na tabela existente no banco de dados, onde cada chave Map() é um nome de coluna e o valor é o conteúdo da variável
  Future<int> insertUsu(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tableUsu, row);
  }

  Future<int> insertCli(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(tableCli, row);
  }

  // método que retorna todas as linhas existentes no banco de dados (tabela)
  Future<List<Map<String, dynamic>>> queryCliId() async {
    Database db = await instance.database;
    return await db.query(tableCli);
  }

  // método para atualizar um registro
  Future<int> updateCli(Map<String, dynamic> row) async {
    Database db = await instance.database;

    int id = row[columnCliId];

    return await db
        .update(tableCli, row, where: '$columnCliId = ?', whereArgs: [id]);
  }

  // método para excluir um registro
  Future<int> deleteCli(int id) async {
    Database db = await instance.database;

    return await db
        .delete(tableCli, where: '$columnCliId = ?', whereArgs: [id]);
  }
}
