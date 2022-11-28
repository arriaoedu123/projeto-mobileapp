import 'package:customer_registration/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:customer_registration/helper.dart';
import 'package:customer_registration/Comm/genLoginSignupHeader.dart';
import 'package:customer_registration/Comm/genTextFormField.dart';

// Colaboração do Pedro Henrique
class CadastroCli extends StatelessWidget {
  CadastroCli({Key key}) : super(key: key);

  // Implementar a lógica da inclusão
  final dbHelper = DatabaseHelper.instance;

  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController rgController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController cepController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _inserir() async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnNome: nomeController.text,
      DatabaseHelper.columnEmail: emailController.text,
      DatabaseHelper.columnRg: rgController.text,
      DatabaseHelper.columnCpf: cpfController.text,
      DatabaseHelper.columnCep: cepController.text,
    };

    // Valor recebido com o número do ID inserido (automaticamente)
    final id = await dbHelper.insert(row);
    print('Registro inserido com sucesso: $id');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cadastrar cliente",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                genLoginSignupHeader('Cadastro'),
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
                  child: TextButton(
                    child: Text(
                      'Cadastrar',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: _inserir,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: TextButton(
                    child: Text(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
