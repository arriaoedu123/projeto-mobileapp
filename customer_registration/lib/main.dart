import 'package:flutter/material.dart';
import 'pages/cadastrousu.dart';
import 'pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de clientes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Login",
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
                      'Entre em sua conta',
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
                        controller: userController,
                        textAlign: TextAlign.center,
                        validator: ((value) =>
                            value!.isEmpty ? "Informe o usuário" : null),
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
                            value!.isEmpty ? "Informe a senha" : null),
                        decoration: const InputDecoration(
                            labelText: 'Informe a senha',
                            labelStyle: TextStyle(fontSize: 18)),
                      ),
                    )
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                onPressed: () {},
                child: const Text(
                  "Entrar",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CadastroUsu()),
                );
              },
              child: const Text(
                "Não tem uma conta? Cadastre-se",
                style: TextStyle(fontSize: 16),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaPrincipal()),
                );
              },
              child: const Text(
                "Página principal (deletar esse botão depois da finalização do app)",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
