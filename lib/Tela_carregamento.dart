// ignore_for_file: unused_import

import 'package:flutter_projeto/Tela_login/login.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class Carregamento extends StatefulWidget {
  @override
  CarregamentoState createState() => CarregamentoState();
}

class CarregamentoState extends State<Carregamento> {
  @override
  void initState() {
    super.initState();
     Future.delayed(Duration(seconds: 2), () {
      // Navegar para a próxima tela após 3 segundos
      Navigator.push(
        context,
        PageTransition(
        child: const LoginPage(),
        type: PageTransitionType.scale,
        alignment: Alignment.center,
        duration: const Duration(milliseconds: 700),
        ),
      );
    });
    // Coloque aqui qualquer código de inicialização necessário
    // por exemplo, você pode fazer uma requisição de dados aqui
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
                  'lib/image/livro.gif',
                  width: 64,
                  height: 64,
                  fit: BoxFit.contain,
                ),
      ),
    );
  }
}
