import 'package:flutter/material.dart';

class AtualizarCli extends StatelessWidget {
  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController rgController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController cepController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Editar cliente",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: _formKey,
                child: Column(
                  children: [
                    const Text(
                      'Editar dados do cliente',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Container(
                      width: 300,
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      child: TextFormField(
                        controller: idController,
                        textAlign: TextAlign.center,
                        validator: ((value) =>
                            value.isEmpty ? "Informe o ID" : null),
                        decoration: const InputDecoration(
                          labelText: 'Informe o ID',
                          labelStyle: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        controller: nameController,
                        textAlign: TextAlign.center,
                        validator: ((value) =>
                            value.isEmpty ? "Informe o nome" : null),
                        decoration: const InputDecoration(
                          labelText: 'Informe o nome',
                          labelStyle: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        controller: emailController,
                        textAlign: TextAlign.center,
                        validator: ((value) =>
                            value.isEmpty ? "Informe o e-mail" : null),
                        decoration: const InputDecoration(
                          labelText: 'Informe o e-mail',
                          labelStyle: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        controller: rgController,
                        textAlign: TextAlign.center,
                        validator: ((value) =>
                            value.isEmpty ? "Informe o RG" : null),
                        decoration: const InputDecoration(
                            labelText: 'Informe o RG',
                            labelStyle: TextStyle(fontSize: 18)),
                      ),
                    ),
                    Container(
                      width: 300,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        controller: cpfController,
                        textAlign: TextAlign.center,
                        validator: ((value) =>
                            value.isEmpty ? "Informe o CPF" : null),
                        decoration: const InputDecoration(
                            labelText: 'Informe o CPF',
                            labelStyle: TextStyle(fontSize: 18)),
                      ),
                    ),
                    Container(
                      width: 300,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        controller: cepController,
                        textAlign: TextAlign.center,
                        validator: ((value) =>
                            value.isEmpty ? "Informe o CEP" : null),
                        decoration: const InputDecoration(
                            labelText: 'Informe o CEP',
                            labelStyle: TextStyle(fontSize: 18)),
                      ),
                    )
                  ],
                )),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {},
              child: const Text(
                "Atualizar",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
