import 'package:flutter_projeto/tela_login/login.dart';
import 'package:flutter/material.dart';
export 'package:flutter_projeto/tela_cadastro/tela_cadastro.dart';

class cadastro extends StatelessWidget {
  const cadastro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height:10),
            SizedBox(
              child: Image.asset(
                  './lib/image/cadastro.png',
                width: 500,
                height: 200,
              ),
            ),
             TextFormField(
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(255, 138, 141, 144),
                  filled: true,
                  labelText: 'E-mail',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 255,
                        255), // Definindo a cor branca para o label
                  ),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            const SizedBox(height: 20),
            TextFormField(
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(255, 138, 141, 144),
                  filled: true,
                  labelText: 'Nome',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 255,
                        255), // Definindo a cor branca para o label
                  ),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(255, 138, 141, 144),
                  filled: true,
                  labelText: 'Número de celular',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 255,
                        255), // Definindo a cor branca para o label
                  ),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: const InputDecoration(
                  fillColor: Color.fromARGB(255, 138, 141, 144),
                  filled: true,
                  labelText: 'Senha',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 255, 255,
                        255), // Definindo a cor branca para o label
                  ),
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height:50),
            SizedBox(
              width: 170,
              height: 70,
            child: ElevatedButton(
              onPressed: () {
                 Navigator.of(context).pushReplacementNamed('/');
              },
              child: const Text(
                'Cadastrar',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            ),

          ],
        ),
      ),
    );
  }
}

Route login() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const LoginPage(),
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