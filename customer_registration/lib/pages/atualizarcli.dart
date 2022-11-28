import 'package:customer_registration/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:customer_registration/helper.dart';
import 'package:customer_registration/Comm/genLoginSignupHeader.dart';
import 'package:customer_registration/Comm/genTextFormField.dart';

class AtualizarCli extends StatelessWidget {
  AtualizarCli({Key key}) : super(key: key);

  TextEditingController idFieldController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController rgController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController cepController = TextEditingController();

  // Implementar a lógica da atualização
  final dbHelper = DatabaseHelper.instance;

  void _listar(String id) async {
    // Os dados chegam em um formato de lista
    final dados = await dbHelper.queryAllId();

    // Criar um laço de repetição para mostrar os dados
    idController.text = dados[int.parse(id) - 1]['_id'].toString();
    nomeController.text = dados[int.parse(id) - 1]['nome'];
    emailController.text = dados[int.parse(id) - 1]['email'];
    rgController.text = dados[int.parse(id) - 1]['rg'];
    cpfController.text = dados[int.parse(id) - 1]['cpf'];
    cepController.text = dados[int.parse(id) - 1]['cep'];
  }

  void _atualizar() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: int.parse(idController.text),
      DatabaseHelper.columnNome: nomeController.text,
      DatabaseHelper.columnEmail: emailController.text,
      DatabaseHelper.columnRg: rgController.text,
      DatabaseHelper.columnCpf: cpfController.text,
      DatabaseHelper.columnCep: cepController.text,
    };

    // Valor recebido com o número do ID atualizado
    final id = await dbHelper.update(row);
    print("Registro atualizado com sucesso.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar cliente'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                genLoginSignupHeader('Editar'),
                getTextFormField(
                  controller: idFieldController,
                  hintName: 'Informe o ID',
                  inputType: TextInputType.number,
                ),
                Container(
                  margin: EdgeInsets.all(30.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextButton(
                      child: Text(
                        'Listar',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        _listar(idFieldController.text);
                      }),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 30.0, right: 30.0, bottom: 30.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextButton(
                    child: const Text(
                      'Voltar',
                      style: TextStyle(color: Colors.blue),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => TelaPrincipal()),
                          (Route<dynamic> route) => false);
                    },
                  ),
                ),
                getTextFormField(
                  controller: idController,
                  hintName: 'ID',
                  isEnable: false,
                ),
                SizedBox(height: 10.0),
                getTextFormField(
                  controller: nomeController,
                  hintName: 'Informe o nome',
                ),
                SizedBox(height: 10.0),
                getTextFormField(
                  controller: emailController,
                  hintName: 'Informe o e-mail',
                ),
                SizedBox(height: 10.0),
                getTextFormField(
                  controller: rgController,
                  hintName: 'Informe o RG',
                ),
                SizedBox(height: 10.0),
                getTextFormField(
                  controller: cpfController,
                  hintName: 'Informe o CPF',
                ),
                SizedBox(height: 10.0),
                getTextFormField(
                  controller: cepController,
                  hintName: 'Informe o CEP',
                ),
                Container(
                  margin: EdgeInsets.all(30.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextButton(
                      child: Text(
                        'Confirmar',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        _atualizar();
                      }),
                ),
                const SizedBox(height: 100.0, width: 150.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
