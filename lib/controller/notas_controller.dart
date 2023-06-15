import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projeto/nota.dart';
import 'login_controller.dart';

class notasController {
  void adicionar(BuildContext context, Nota nota) {
    FirebaseFirestore.instance
        .collection('notas')
        .add(nota.toJson())
        .then((value) {
      _sucesso(context, 'Nota adicionada com sucesso');
      Navigator.pop(context); // Voltar para a tela anterior
    }).catchError((e) => _erro(context, 'ERRO: ${e.code.toString()}'));
  }

  void atualizar(BuildContext context, String id, Nota nota) {
    FirebaseFirestore.instance
        .collection('notas')
        .doc(id)
        .update(nota.toJson())
        .then((value) {
      _sucesso(context, 'Nota atualizada com sucesso');
      Navigator.pop(context); // Voltar para a tela anterior
    }).catchError((e) => _erro(context, 'ERRO: ${e.code.toString()}'));
  }

  void excluir(BuildContext context, String id) {
    FirebaseFirestore.instance
        .collection('notas')
        .doc(id)
        .delete()
        .then((value) => _sucesso(context, 'Nota excluída com sucesso'))
        .catchError((e) => _erro(context, 'ERRO: ${e.code.toString()}'));
  }

  Query listar() {
    return FirebaseFirestore.instance
        .collection('notas')
        .where('uid', isEqualTo: LoginController().idUsuario());
  }

  void _sucesso(BuildContext context, String mensagem) {
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

  void _erro(BuildContext context, String mensagem) {
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
