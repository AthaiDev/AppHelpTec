// ignore_for_file: prefer_const_constructors

import 'Tela_login/login.dart';
import 'Tela_esqueceu_senha/tela_esqueceu_senha.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HelpDev',
      home: LoginPage(),
    )
  );
}