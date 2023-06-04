import 'package:flutter/material.dart';
import '../controller/login_controller.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});
  
  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  var txtNome = TextEditingController();
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

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
             TextField(
              controller: txtEmail,
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
            TextField(
                controller: txtNome,
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
              TextField(
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
              TextField(
                controller: txtSenha,
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
                    LoginController().criarConta(
                      context,
                      txtNome.text,
                      txtEmail.text,
                      txtSenha.text,
                    );
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

/*Route login() {
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
}*/