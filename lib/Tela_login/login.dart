// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_projeto/Tela_esqueceu_senha/tela_esqueceu_senha.dart';
import '../tela_esqueceu_senha/tela_esqueceu_senha.dart';
import '../tela_cadastro/tela_cadastro.dart';
import '../tela_menu.dart';
import '../tela_material.dart';
import '../controller/login_controller.dart';
import 'package:flutter_projeto/util.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  var txtEmailEsqueceuSenha = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
        child: Container(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 15),
              Container(
                child: Image.asset(
                  'lib/image/folhas.gif',
                  width: 128,
                  height: 128,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 10),
              Container(
                child: const Text(
                  'HELPTEC',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xFF0091ff),
                    fontWeight: FontWeight.bold, // adicionado
                  ),
                ),
                alignment: Alignment.center,
              ),
              SizedBox(height: 30),
              TextField(
                controller: txtEmail,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    hintText: 'Digite seu email...',
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.alternate_email),
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 15),
              TextField(
                controller: txtSenha,
                obscureText: true,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    hintText: 'Digite sua senha...',
                    labelText: 'Senha',
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.private_connectivity),
                    border: OutlineInputBorder()),
              ),

              //>>>>>>BOTÃO DE ESQUECEU A SENHA <<<<<<
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'esqueci');
                    },
                    child: const Text(
                      'Esqueci minha senha!',
                      style: TextStyle(
                        color: Color(0xFF0091ff),
                      ),
                    ),
                  ),
                ),
              ),

              //>>>>>> BOTÃO ENTRAR <<<<<<
              const SizedBox(height: 20),
              SizedBox(
                width: 150,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    LoginController().login(
                      context,
                      txtEmail.text,
                      txtSenha.text,
                    );
                  },
                  child: Text('Entrar'),
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

              // >>>>>> BOTÃO CADASTRAR <<<<<<
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'cadastrar');
                },
                child: const Text(
                  'Criar Conta',
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // >>>>>>BOTÕES "CONECTAR COM" <<<<<<
              const SizedBox(height: 20),
              Text(
                'Conectar com',
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 55,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Icon(Icons.facebook,
                          color: Colors.blue, size: 50),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.zero,
                        elevation: 2,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 55,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Icon(Icons.apple,
                          color: Colors.black, size: 55),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 255, 255, 255),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.zero,
                        elevation: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}