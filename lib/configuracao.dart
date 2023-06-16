// ignore_for_file: unused_import, duplicate_import
import 'dart:js';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../configuracao.dart';
import '../tela_login/login.dart';
import '../tela_cadastro/tela_cadastro.dart';
import 'package:flutter/material.dart';
import '../controller/login_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_projeto/util.dart';

class Config extends StatefulWidget {
  const Config({Key? key}) : super(key: key);

  @override
  _ConfigState createState() => _ConfigState();
}

class _ConfigState extends State<Config> {
  TextEditingController nomeController = TextEditingController();
  var txtNome = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações', textAlign: TextAlign.center),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 30, 40, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 180,
                height: 50,
                child: ElevatedButton(
                  child: Text('Alterar nome',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal, // adicionado
                  ),),
                  onPressed: () {
                    String novoNome = '';
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Alterar Nome'),
                          content: TextField(
                            controller: nomeController,
                            decoration: InputDecoration(
                              hintText: 'Digite o novo nome',
                            ),
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
                              onPressed: ()  {
                                String novoNome = nomeController.text;
                               
                                  setState(() {
                                if (novoNome.isNotEmpty) {  
                                      LoginController()
                                      .atualizarNomeUsuario(context, novoNome);
                                  

                                }
                                  });

                                 
                                
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 180,
                height: 50,
                child: ElevatedButton(
                  child: Text('Alterar senha',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal, // adicionado
                  ),),
                  onPressed: () {
                    LoginController().alterarSenha(context);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}