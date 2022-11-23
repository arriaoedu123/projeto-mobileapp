import 'package:flutter/material.dart';
import '../main.dart';

class CadastroUsu extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cadastrar usuário",
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
                      'Cadastre o usuário',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Container(
                      width: 300,
                      margin: const EdgeInsets.only(top: 20),
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
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      child: TextFormField(
                        controller: userController,
                        textAlign: TextAlign.center,
                        validator: ((value) =>
                            value.isEmpty ? "Informe o usuário" : null),
                        decoration: const InputDecoration(
                          labelText: 'Informe o usuário',
                          labelStyle: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      margin: const EdgeInsets.only(bottom: 20),
                      child: TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        textAlign: TextAlign.center,
                        validator: ((value) =>
                            value.isEmpty ? "Informe a senha" : null),
                        decoration: const InputDecoration(
                            labelText: 'Informe a senha',
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
                "Cadastrar",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
