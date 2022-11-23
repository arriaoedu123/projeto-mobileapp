import 'package:flutter/material.dart';

class DeletarCli extends StatelessWidget {
  TextEditingController idController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Deletar cliente",
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
                      'Delete um cliente',
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
                  ],
                )),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () {},
              child: const Text(
                "Deletar",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
