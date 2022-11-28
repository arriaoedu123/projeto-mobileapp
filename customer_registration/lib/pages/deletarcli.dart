import 'package:customer_registration/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:customer_registration/helper.dart';
import 'package:customer_registration/Comm/genLoginSignupHeader.dart';
import 'package:customer_registration/Comm/genTextFormField.dart';

class DeletarCli extends StatelessWidget {
  DeletarCli({Key key}) : super(key: key);

  TextEditingController idFieldController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController nomeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController rgController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController cepController = TextEditingController();

  final dbHelper = DatabaseHelper.instance;

  void _listar(String id) async {
    final dados = await dbHelper.queryAllId();

    idController.text = dados[int.parse(id) - 1]['_id'].toString();
    nomeController.text = dados[int.parse(id) - 1]['nome'];
    emailController.text = dados[int.parse(id) - 1]['email'];
    rgController.text = dados[int.parse(id) - 1]['rg'];
    cpfController.text = dados[int.parse(id) - 1]['cpf'];
    cepController.text = dados[int.parse(id) - 1]['cep'];
  }

  void _excluir(String id) async {
    await dbHelper.delete(int.parse(id));
    print("Registro excluído com sucesso.");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar cliente'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                genLoginSignupHeader('Deletar'),
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
                  hintName: 'Nome',
                  isEnable: false,
                ),
                SizedBox(height: 10.0),
                getTextFormField(
                  controller: emailController,
                  hintName: 'E-mail',
                  isEnable: false,
                ),
                SizedBox(height: 10.0),
                getTextFormField(
                  controller: rgController,
                  isEnable: false,
                  hintName: 'RG',
                ),
                SizedBox(height: 10.0),
                getTextFormField(
                  controller: cpfController,
                  isEnable: false,
                  hintName: 'CPF',
                ),
                SizedBox(height: 10.0),
                getTextFormField(
                  controller: cepController,
                  isEnable: false,
                  hintName: 'CEP',
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
                        _excluir(idController.text);
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
