// Importação dos arquivos
// ignore_for_file: unused_import, depend_on_referenced_packages, unused_field
import 'dart:io'; // gravação entrada/saída
import 'package:path/path.dart'; // caminho dos arquivos
import 'package:path_provider/path_provider.dart'; // provedor de caminho
import 'package:sqflite/sqflite.dart'; // banco de dados

// Classe principal da conexão com o banco de dados
class DatabaseHelper {
  // variáveis globais do banco
  static const _databaseName = "SqliteDB.db"; // nome do banco
  static const _databaseVersion = 1; // versão do banco

  // variável para a tabela
  static const table = 'cliente';

  // variáveis para os campos da tabela
  static const columnId = '_id';
  static const columnNome = 'nome';
  static const columnEmail = 'email';
  static const columnRg = 'rg';
  static const columnCpf = 'cpf';
  static const columnCep = 'cep';

  // Design Pattern para conexões no modo Singleton
  DatabaseHelper._privateConstructor();

  // criação de uma variável para a instância do banco
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Referência "única" para o banco de dados
  // Neste ponto, verificamos se o banco existe fisicamente
  // Obs.: A interrogação diz que a variável aceita valores nulos
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database; // o banco existe

    // Retorna a inicialização do banco
    // await significa aguardar
    _database = await _initDatabase();
    return _database;
  }

  // Método _initDatabase()
  _initDatabase() async {
    // Verificar o caminho físico do banco e se há permissão de abertura
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);

    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  // Método que cria um novo banco e tabelas, caso não exista
  // Vamos usar código SQL
  Future _onCreate(Database db, int version) async {
    await db.execute(
        '''
        CREATE TABLE $table (
          $columnId INTEGER PRIMARY KEY,
          $columnNome TEXT NOT NULL,
          $columnEmail TEXT NOT NULL,
          $columnRg TEXT NOT NULL,
          $columnCpf TEXT NOT NULL,
          $columnCep TEXT NOT NULL
        );
      ''');
  }

  // Métodos do CRUD (Create, Read, Update, Delete)
  // ##############################################

  // Método de inclusão de dados (C)
  // Insere uma linha na tabela existente no banco de dados, onde cada chave
  // Map() é um nome de coluna e o valor é o conteúdo da variável.
  // O valor de retorno deste método é a chave do registro (ID)
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // Método que retorna todas as linhas existentes no banco (tabela) por ID
  Future<List<Map<String, dynamic>>> queryAllId() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  // Método para atualizar um registro
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;

    // Pega a coluna ID
    int id = row[columnId];

    // Aplica a atualização nos dados informados
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
