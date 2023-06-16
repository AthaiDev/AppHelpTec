import 'package:cloud_firestore/cloud_firestore.dart';
  import 'package:firebase_auth/firebase_auth.dart';
  import 'package:flutter/material.dart';

  import '../util.dart';

  class LoginController {
    // Criação de uma nova conta de usuário no Firebase Authentication
    criarConta(context, nome, email, senha, telefone) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: senha)
        .then((resultado) {
      // Conta criada com sucesso
      String uid = resultado.user!.uid;
      FirebaseFirestore.instance.collection('usuarios').doc(uid).set({
        'uid': uid,
        'nome': nome,
        'email': email,
        'telefone': telefone,
        
      });

      sucesso(context, 'Usuário criado com sucesso.');
      Navigator.pop(context);
    }).catchError((e) {
      // Não foi possível criar a conta
      switch (e.code) {
        case 'email-already-in-use':
          erro(context, 'O email já foi cadastrado.');
          break;
        case 'invalid-email':
          erro(context, 'O formato do email é inválido.');
          break;
        default:
          erro(context, 'ERRO: ${e.code}');
      }
    });
  }


    // Efetuar o login de um usuário previamente cadastrado no serviço Firebase Authentication
    login(context, email, senhaCorreta) {
      FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: senhaCorreta)
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
            erro(context, 'Usuário ou senha incorreta.');
        }
      });
    }

    // Envia uma mensagem de email para recuperação de senha para uma conta de email válida
    esqueceuSenha(context, String email) {
      if (email.isNotEmpty) {
        FirebaseAuth.instance.sendPasswordResetEmail(
          email: email,
        );
        sucesso(context, 'Email enviado com sucesso.');
      } else {
        erro(context, 'Informe o email para recuperar a conta.');
      }
      Navigator.pop(context);
    }

    // Faz logout do usuário
    logout() {
      FirebaseAuth.instance.signOut();
    }

    // Retorna o ID do usuário logado
    idUsuario() {
      return FirebaseAuth.instance.currentUser!.uid;
    }

    // Retorna o nome do usuário logado
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

  Future<String> atualizarNomeUsuario(BuildContext context, novoNome) async {
  var nomeNovo = novoNome;
  var userId =  FirebaseAuth.instance.currentUser!.uid;

  FirebaseFirestore.instance
      .collection('usuarios')
      .doc(userId)
      .set({'nome': novoNome }, SetOptions(merge: true))
      .then((result) {
        sucesso(context, 'Nome do usuário atualizado com sucesso.');
        Navigator.of(context).popAndPushNamed('principal');
  }).catchError((e) {
    erro(context, 'Erro na atualização: ${e.toString()}');
    Navigator.of(context).pop();
  });

  return nomeNovo;
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
  }