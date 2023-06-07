// ignore_for_file: unused_import, duplicate_import
import 'package:cloud_firestore/cloud_firestore.dart';
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
        title: Text('Dashboard', textAlign: TextAlign.center),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            FutureBuilder<String>(
              future: LoginController().usuarioLogado(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                return Directionality(
                    textDirection: TextDirection.ltr,
                    child: TextButton.icon(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.black,
                        textStyle: TextStyle(fontSize: 12),
                      ),
                      onPressed: () {
                        LoginController().logout();
                        Navigator.pushReplacementNamed(context, 'login');
                      },
                      icon: Icon(Icons.exit_to_app, size: 14),
                      label: Text(snapshot.data.toString()),
                    )
                );
                }

                return Text('');
              },
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
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 30, 40, 10),
        child: Column(
          children: [
            SizedBox(
                    width: 300,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        LoginController();
                      },
                      child: Text('MPCT'),
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
                  SizedBox(height: 30),
                  SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    LoginController();
                  },
                  child: Text('Engenharia de Software'),
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
              SizedBox(height: 30),
                  SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    LoginController();
                  },
                  child: Text('Sistemas Operacionais'),
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
              SizedBox(height: 30),
                  SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    LoginController();
                  },
                  child: Text('Engenharia de Software',
                  textAlign: TextAlign.justify),
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
              SizedBox(height: 30),
                  SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    LoginController();
                  },
                  child: Text('Programação para Dispositivos Móveis', textAlign: TextAlign.center),
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
              SizedBox(height: 30),
                  SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    LoginController();
                  },
                  child: Text('Programação Orientada a Objetos', textAlign: TextAlign.center),
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
              SizedBox(height: 30),
                  SizedBox(
                    
                width: 300,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    LoginController();
                  },
                  
                  child: Text('Banco de Dados', textAlign: TextAlign.center),
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
