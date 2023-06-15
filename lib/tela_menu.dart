// ignore_for_file: unused_import, duplicate_import
import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../configuracao.dart';
import '../tela_login/login.dart';
import '../tela_cadastro/tela_cadastro.dart';
import 'package:flutter/material.dart';
import '../controller/login_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  TextEditingController nomeController = TextEditingController();
  var txtNome = TextEditingController();


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
            FutureBuilder<String>(
              future: LoginController().usuarioLogado(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  final String nomeUsuario = snapshot.data ?? '';
                  
                  return Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 90, height: 50,),
                          Icon(Icons.person, size: 25),
                          SizedBox(width: 4),
                          Text(
                            nomeUsuario,
                            style: TextStyle(fontSize: 25),
                          ),
                        ],
                      ),
                      //SizedBox(height: 4),
                    ],
                  );
                }
                return Text('');
              },
            ),
            Container(
              padding: EdgeInsets.fromLTRB(40, 1, 40, 10),
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
                              child: Text('Configurações'),
                              onPressed: () {
                                Navigator.pushNamed(context, 'configuracao');
                              },
                            ),
                          ),
                        ],
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
                                      title: Text('Aplicativo HelpTec desenvolvido por Athaide de Souza Matos e Nathan Corrêa Dias , alunos do curso de Análise e desenvolvimento de sistemas da Fatec de Ribeirão Preto, o objetivo do aplicativo é ser usado como ferramenta de estudo teórico e pratico para o aluno no decorrer do curso.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 20,
                                      )),
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
                    children: [
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
                  Navigator.pushNamed(context, 'materia');
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

