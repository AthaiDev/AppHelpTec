// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_projeto/controller/login_controller.dart';


class EsqueciMinhaSenha extends StatefulWidget {
  @override
  _EsqueciMinhaSenhaState createState() => _EsqueciMinhaSenhaState();
}

class _EsqueciMinhaSenhaState extends State<EsqueciMinhaSenha> {
  final _formKey = GlobalKey<FormState>();
  var txtEmailEsqueceuSenha = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async{
    try{
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: _emailController.text.trim());
        showDialog(
        context: context, 
        builder: (context) {
          return AlertDialog(
            content : Text("Email de recuperação de senha enviado com sucesso! Cheque seu e-mail."),
          );
         },
       );
    } on FirebaseAuthException catch(e){
      print(e);
      showDialog(
        context: context, 
        builder: (context) {
          return AlertDialog(
            content : Text(e.message.toString()),
          );
         },
       );
      }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xFF0091ff),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Text(
          "Insira seu email para enviarmos o link de recuperação",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
      SizedBox(height: 10),
      Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: _emailController,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.deepPurple),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: 'Email',
          fillColor: Colors.grey[200],
          filled: true,
        ),
       ),
      ),
      SizedBox(height: 10),
      MaterialButton(
       onPressed: () {
      passwordReset();
    },
  child: Text('Redefinir Senha'),
  color: Color(0xFF0091ff),
),
     ],
    ),
   );
  }
}