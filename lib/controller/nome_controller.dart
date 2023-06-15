import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class nome_controller {
Future<String> atualizarNomeUsuario(BuildContext context, novoNome) async {
  var nomeNovo = novoNome;
  var userId =  FirebaseAuth.instance.currentUser!.uid;

  FirebaseFirestore.instance
      .collection('usuarios')
      .doc(userId)
      .set({'nome': novoNome}, SetOptions(merge: true))
      .then((result) {
    sucesso(context, 'Nome do usuário atualizado com sucesso.');
  }).catchError((e) {
    erro(context, 'Erro na atualização: ${e.toString()}');
  });

  return nomeNovo;
}
void sucesso(BuildContext context, String mensagem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sucesso'),
          content: Text(mensagem),
          actions: [
            TextButton(
              child: Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void erro(BuildContext context, String mensagem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Erro'),
          content: Text(mensagem),
          actions: [
            TextButton(
              child: Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}