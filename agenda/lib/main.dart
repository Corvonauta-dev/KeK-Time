import 'package:agenda/pages/Horarios/pghorario.dart';
import 'package:agenda/pages/Login/pglogin.dart';
import 'package:agenda/pages/Tela_inicial/pgtelaini.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: JanelaLogin(),
    );
  }
}
