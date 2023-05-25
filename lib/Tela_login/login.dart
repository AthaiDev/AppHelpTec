import 'package:flutter/material.dart';
import 'package:flutter_projeto/tela_esqueceu_senha/tela_esqueceu_senha.dart';
import 'package:flutter_projeto/tela_cadastro/tela_cadastro.dart';
import 'package:flutter_projeto/tela_menu.dart';
import 'package:flutter_projeto/tela_material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 30, 40, 30),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Image.asset(
                'lib/image/logo.png',
                width: 200,
                height: 150,
              ),
            ),
            SizedBox(height: 30),
            TextField(
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
            Padding(
              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(_esqueciMinhaSenha());
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
            const SizedBox(height: 20),
            SizedBox(
              width: 170,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(_menu());
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
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(_cadastro());
              },
              child: const Text(
                'Criar Conta',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Conectar com',
              style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0),
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 65,
                  height: 65,
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
                  width: 65,
                  height: 65,
                  child: ElevatedButton(
                    onPressed: () {},
                    child:
                        const Icon(Icons.apple, color: Colors.black, size: 50),
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
    );
  }
}

Route _cadastro() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const cadastro(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _esqueciMinhaSenha() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) =>
        esqueciMinhaSenha(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _menu() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const menu(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

Route _material() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const menu(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
