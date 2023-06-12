// ignore_for_file: unused_import, duplicate_import
import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../configuracao.dart';
import '../tela_login/login.dart';
import '../tela_cadastro/tela_cadastro.dart';
import 'package:flutter/material.dart';
import '../controller/login_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  Future<void> openDialog(
      BuildContext context, String message, String novoNome) async {
    String novoNome = '';

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(message),
          content: TextField(
            decoration: InputDecoration(hintText: 'Escreva Aqui...'),
            onChanged: (value) {
              novoNome = value;
            },
          ),
          actions: [
            TextButton(
              child: Text('Salvar'),
              onPressed: () {
                LoginController().alterarNome(context, novoNome);
                Navigator.of(context).pop(); // Fechar o diálogo após salvar
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard', textAlign: TextAlign.center),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            FutureBuilder<User?>(
  future: FirebaseAuth.instance.authStateChanges().first,
  builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
    if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
      final User? user = snapshot.data;
      final String nomeUsuario = user?.displayName ?? '';
      final String emailUsuario = user?.email ?? '';

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.person, size: 14),
              SizedBox(width: 4),
              Text(
                nomeUsuario,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.email, size: 14),
              SizedBox(width: 4),
              Text(
                emailUsuario,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ],
      );
    }
    return Text('');
  },
),
            Container(
              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Icon(
                            Icons.person,
                            size: 24,
                          ),
                          SizedBox(width: 10),
                          SizedBox(
                            width: 180,
                            height: 50,
                            child: ElevatedButton(
                              child: Text('Alterar nome'),
                              onPressed: () {
                                String novoNome = '';
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Alterar Nome'),
                                      content: TextField(
                                        decoration: InputDecoration(
                                          hintText: 'Digite o novo nome',
                                        ),
                                        onChanged: (value) {
                                          novoNome = value;
                                        },
                                      ),
                                      actions: [
                                        TextButton(
                                          child: Text('Cancelar'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text('Salvar'),
                                          onPressed: () {
                                            LoginController()
                                                .alterarNome(context, novoNome);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height:30),
                  Row(
                    children: [
                      Icon(
                        Icons.lock,
                        size: 24,
                      ),
                      SizedBox(width: 10),
                      SizedBox(
                        width: 180,
                        height: 50,
                        child: ElevatedButton(
                          child: Text('Alterar senha'),
                          onPressed: () {
                            LoginController().alterarSenha(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Icon(
                        Icons.document_scanner_outlined,
                        size: 24,
                      ),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          SizedBox(
                            width: 180,
                            height: 50,
                            child: ElevatedButton(
                              child: Text('Termos de uso'),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Termos de uso'),
                                      actions: [
                                        TextButton(
                                          child: Text('Voltar'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Row(
                    children:[
                      Icon(
                        Icons.exit_to_app,
                        size: 24,
                      ),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          SizedBox(
                            width: 180,
                            height: 50,
                            child: ElevatedButton(
                              child: Text('Sair'),
                              onPressed: () {
                                LoginController().logout();
                                Navigator.pushReplacementNamed(
                                    context, 'login');
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 30, 40, 10),
        child: Column(
          children: [
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  LoginController();
                },
                child: Text('MPCT'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0091ff),
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  LoginController();
                },
                child: Text('Engenharia de Software'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0091ff),
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  LoginController();
                },
                child: Text('Sistemas Operacionais'),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0091ff),
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  LoginController();
                },
                child: Text('Engenharia de Software',
                    textAlign: TextAlign.justify),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0091ff),
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  LoginController();
                },
                child: Text('Programação para Dispositivos Móveis',
                    textAlign: TextAlign.center),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0091ff),
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  LoginController();
                },
                child: Text('Programação Orientada a Objetos',
                    textAlign: TextAlign.center),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0091ff),
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  LoginController();
                },
                child: Text('Banco de Dados', textAlign: TextAlign.center),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFF0091ff),
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Route _configuracao() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        const Configuracao(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
