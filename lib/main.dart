// ignore_for_file: prefer_const_constructors, unused_import
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projeto/Tela_carregamento.dart';
import 'package:flutter_projeto/Tela_esqueceu_senha/tela_esqueceu_senha.dart';
import 'package:flutter_projeto/configuracao.dart';
import 'package:flutter_projeto/materiaflutter.dart';
import 'firebase_options.dart';
import 'Tela_cadastro/tela_cadastro.dart';
import 'Tela_login/login.dart';
import 'package:flutter_projeto/tela_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_projeto/util.dart';


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
          'configuracao': (context) => Config(),
          //'materia': (context) => PDFPage(pdfPath: 'lib\image\P1_SOII.pdf'),
        },
      ),
    ),
  );
}