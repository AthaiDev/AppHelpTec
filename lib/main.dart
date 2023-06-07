// ignore_for_file: prefer_const_constructors
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projeto/Tela_carregamento.dart';
import 'package:flutter_projeto/Tela_esqueceu_senha/tela_esqueceu_senha.dart';

import 'firebase_options.dart';
import 'Tela_cadastro/tela_cadastro.dart';
import 'Tela_login/login.dart';
import 'package:flutter_projeto/tela_menu.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MaterialApp(
        useInheritedMediaQuery: true,
        debugShowCheckedModeBanner: false,
        initialRoute: 'carregar',
        routes: {
          'carregar': (context) => Carregamento(),
          'cadastrar': (context) => Cadastro(),
          'login': (context) => LoginPage(),
          'principal': (context) => Menu(),
          'esqueci': (context) => EsqueciMinhaSenha(),
        },
      ),
    ),
  );
}