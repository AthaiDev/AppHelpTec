// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_projeto/controller/login_controller.dart';
import 'package:flutter_projeto/util.dart';


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
          Future.delayed(Duration(seconds: 2), () {
          Navigator.of(context).pop(true);
          Navigator.pop(context); // Fecha o diálogo após 2 segundos
        });
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
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            SizedBox(height: 60,),
            Container(
                child: Image.asset(
                  'lib/image/esqsenha.png',
                  width: 138,
                  height: 128,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: Text(
            "Insira seu email para enviarmos o link de recuperação",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(height: 30),
        Padding(padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: TextField(
          controller: _emailController,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.0
              ),
            ),
            hintText: 'Digite seu email...',
            fillColor: Color.fromARGB(255, 255, 255, 255),
            filled: true,
          ),
         ),
        ),
        SizedBox(height: 30),
        SizedBox(
          width: 160,
            height: 50,
          child: ElevatedButton(
           onPressed: () {
          passwordReset();
            },
          child: Text('Redefinir a senha'),
          style: ElevatedButton.styleFrom(
            primary: Color(0xFF0091ff),
                        textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
          )
          //color: Color(0xFF0091ff),
        ),
        ),
           ],
          ),
      ),
   );
  }
}