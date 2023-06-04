// ignore_for_file: unused_import, duplicate_import

import '../configuracao.dart';
import '../tela_login/login.dart';
import '../tela_cadastro/tela_cadastro.dart';
import 'package:flutter/material.dart';
import '../controller/login_controller.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('./lib/image/oliver.jpeg'),
                radius: 30.0,
              ),
              accountName: Text('Oliveira'),
              accountEmail: Text('oliveira@outlook.com.br'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Inicio'),
              subtitle: Text('tela de inicio'),
              onTap: () {
                print('home');
              }, 
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Configurações'),
              subtitle: Text('Altere as definições da sua conta'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Configuracao()));
              }, 
            ),
            ListTile(
              leading: Icon(Icons.question_mark),
              title: Text('Sobre'),
              subtitle: Text('Saiba mais'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Configuracao()));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              subtitle: Text('Sair'),
              onTap: () {
                 LoginController().logout();
                        Navigator.pushReplacementNamed(context, 'login');
              }, 
            ),
          ],
        ),
      ),
    );
  }
}

Route _configuracao() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const Configuracao(),
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
