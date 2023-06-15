import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_projeto/util.dart';

void alterarSenha(BuildContext context) {
    String novaSenha = '';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Alterar Senha'),
          content: TextField(
            decoration: InputDecoration(hintText: 'Digite a nova senha'),
            onChanged: (value) {
              novaSenha = value;
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
              onPressed: () async {
                try {
                  User? user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                    await user.updatePassword(novaSenha);
                    sucesso(context, 'Senha alterada com sucesso.');
                  }
                } catch (e) {
                  erro(context, 'Erro ao alterar a senha: $e');
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }