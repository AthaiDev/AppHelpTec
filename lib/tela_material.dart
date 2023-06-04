import 'package:flutter/material.dart';
export '../tela_cadastro/tela_cadastro.dart';
import '../controller/login_controller.dart';

class Material extends StatelessWidget {
  const Material({Key? key}) : super(key: key);

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
                'Cadastrar',
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
                Navigator.of(context).pop(Material());
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