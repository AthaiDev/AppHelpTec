import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginController {
  criarConta(context, nome, email, senha, telefone) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: email,
          password: senha,
        )
        .then((resultado) {
      FirebaseFirestore.instance.collection('usuarios').add({
        'uid': resultado.user!.uid,
        'nome': nome,
        'email': email,
        'telefone': telefone,
      });

      sucesso(context, 'Usuário criado com sucesso.');
      Navigator.pop(context);
    }).catchError((e) {
      switch (e.code) {
        case 'email-already-in-use':
          erro(context, 'O email já foi cadastrado.');
          break;
        case 'invalid-email':
          erro(context, 'O formato do email é inválido.');
          break;
        default:
          erro(context, 'ERRO: ${e.code.toString()}');
      }
    });
  }

  login(context, email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then((resultado) {
      sucesso(context, 'Usuário autenticado com sucesso.');
      Navigator.pushNamed(context, 'principal');
    }).catchError((e) {
      switch (e.code) {
        case 'invalid-email':
          erro(context, 'O formato do email é inválido.');
          break;
        case 'user-not-found':
          erro(context, 'Usuário não encontrado.');
          break;
        case 'wrong-password':
          erro(context, 'Senha incorreta.');
          break;
        default:
          erro(context, 'ERRO: ${e.code.toString()}');
      }
    });
  }

  esqueceuSenha(context, String email) {
    if (email.isNotEmpty) {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      sucesso(context, 'Email enviado com sucesso.');
    } else {
      erro(context, 'Informe o email para recuperar a conta.');
    }
    Navigator.pop(context);
  }

  logout() {
    FirebaseAuth.instance.signOut();
  }

  String idUsuario() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  Future<String> usuarioLogado() async {
    var usuario = '';
    await FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: idUsuario())
        .get()
        .then((resultado) {
      usuario = resultado.docs[0].data()['nome'] ?? '';
    });
    return usuario;
  }

  void alterarNome(BuildContext context, String novoNome) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      TextEditingController nomeController = TextEditingController(text: novoNome);

      return AlertDialog(
        title: Text('Alterar Nome'),
        content: TextField(
          controller: nomeController,
          decoration: InputDecoration(hintText: 'Digite o novo nome'),
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
              String userId = idUsuario();

              FirebaseFirestore.instance
                  .collection('usuarios')
                  .doc(userId)
                  .update({'nome': novoNome}).then((_) {
                sucesso(context, 'Nome do usuário atualizado com sucesso.');
              }).catchError((e) {
                erro(context, 'Erro ao atualizar o nome do usuário: $e');
              });
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

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
