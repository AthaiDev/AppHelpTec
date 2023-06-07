import 'package:flutter/material.dart';
import '../controller/login_controller.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});
  
  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  var txtTelefone = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        padding: EdgeInsets.fromLTRB(40, 0, 40, 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.asset(
                  './lib/image/cadastro.png',
                width: 500,
                height: 200,
              ),
            ),
            SizedBox(child: const Text(
                  'Cadastre-se',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFF0091ff),
                    fontWeight: FontWeight.normal, // adicionado
                  ),
                ),
                ),
            SizedBox(height: 20),
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
            const SizedBox(height: 20),
            TextField(
                controller: txtNome,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    hintText: 'Digite seu nome...',
                    labelText: 'Nome',
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.person_2),
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
              TextField(
                controller: txtTelefone,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    hintText: 'Digite seu numero...',
                    labelText: 'Numero',
                    labelStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.smartphone),
                    border: OutlineInputBorder()),
              ),
              SizedBox(height: 20),
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
              SizedBox(height:30),
            SizedBox(
              width: 150,
              height: 50,
            child: ElevatedButton(
              onPressed: () {
                    LoginController().criarConta(
                      context,
                      txtNome.text,
                      txtEmail.text,
                      txtSenha.text,
                      txtTelefone.text,
                    );
                  },
              child: const Text(
                'Cadastrar',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancelar',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF0091ff),
                    fontWeight: FontWeight.normal, // adicionado
                  ),),
                  
                ),
                              ],
            ),
          ],
        ),
      ),
    );
  }
}