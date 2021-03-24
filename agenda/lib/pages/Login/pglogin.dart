import 'package:agenda/pages/Cadastro/pgcadastro.dart';
import 'package:agenda/pages/Tela_inicial/pgtelaini.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class JanelaLogin extends StatefulWidget {
  const JanelaLogin({Key key}) : super(key: key);

  @override
  _JanelaLoginState createState() => _JanelaLoginState();
}

class _JanelaLoginState extends State<JanelaLogin> {
  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double totalHeight = MediaQuery.of(context).size.height;
    double geralScale = (totalWidth < totalHeight) ? totalWidth : totalHeight;

    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                child: Wrap(children: <Widget>[
      Container(
          width: (geralScale * 0.7),
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border.all(color: Colors.black, style: BorderStyle.solid)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(height: geralScale * 0.03),
                Text("Login", textScaleFactor: (geralScale * 0.011)),
                Container(height: geralScale * 0.05),
                Container(
                    height: (geralScale * 0.1),
                    width: (geralScale * 0.6),
                    child: TextField(
                        decoration: (new InputDecoration(
                            labelText: "Usuário",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0.0))),
                            filled: true,
                            fillColor: Colors.white)))),
                Container(height: geralScale * 0.02),
                Container(
                    height: (geralScale * 0.1),
                    width: (geralScale * 0.6),
                    child: TextField(
                        obscureText: true,
                        obscuringCharacter: "•",
                        decoration: (new InputDecoration(
                            labelText: "Senha",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0.0))),
                            filled: true,
                            fillColor: Colors.white)))),
                Container(height: geralScale * 0.06),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PgTelaIni()));
                    },
                    child: Container(
                        alignment: AlignmentDirectional.center,
                        height: (geralScale * 0.1),
                        width: (geralScale * 0.4),
                        decoration: BoxDecoration(color: Colors.black),
                        child: Text("Entrar",
                            textScaleFactor: geralScale * 0.006,
                            style: TextStyle(color: Colors.white)))),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JanelaCadastro()));
                    },
                    child: Text("Cadastrar",
                        textScaleFactor: (geralScale * 0.003))),
                Container(height: geralScale * 0.03)
              ]))
    ]))));
  }
}
