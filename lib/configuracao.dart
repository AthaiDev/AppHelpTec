import 'package:flutter/material.dart';
import 'Tela_login/login.dart';



class Configuracao extends StatelessWidget {
  const Configuracao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height:50),
            SizedBox(
              child: Image.asset(
                'lib/images/logocad.png',
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
                  labelText: 'Número de celular com ddd',
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
                // Lógica de cadastro aqui
              },
              child: const Text(
                'Salvar',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            ),
            SizedBox(height:50),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(login());
              },
              child: const Text(
                'Voltar',
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
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