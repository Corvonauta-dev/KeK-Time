import 'package:agenda/pages/Cadastro/pgcadastro.dart';
import 'package:agenda/pages/Tela_inicial/pgtelaini.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class JanelaLogin extends StatefulWidget {
  const JanelaLogin({Key key}) : super(key: key);

  @override
  _JanelaLoginState createState() => _JanelaLoginState();
}

int corLogin = Colors.white.value;
int corSenha = Colors.white.value;
int corAviso = Colors.transparent.value;

class _JanelaLoginState extends State<JanelaLogin> {
  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double totalHeight = MediaQuery.of(context).size.height;
    double geralScale = (totalWidth < totalHeight) ? totalWidth : totalHeight;

    bool funcLogin(String login, String senha) {
      //"MACHINES" - Morpheus, 2199
      return true;
    }

    Text txtErro = new Text("Login ou senha incorretos",
        textScaleFactor: (geralScale * 0.003),
        style: new TextStyle(color: Color(corAviso)));

    BoxDecoration quadradoCentral = new BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, style: BorderStyle.solid));

    TextField fieldLogin = new TextField(
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.deny(RegExp("[\",/\\\\]"))
        ],
        controller: new TextEditingController(),
        decoration: new InputDecoration(
            labelText: "Usuário",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(0.0))),
            filled: true,
            fillColor: Color(corLogin)));

    TextField fieldSenha = new TextField(
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.deny(RegExp("[\",/\\\\]"))
        ],
        controller: new TextEditingController(),
        obscureText: true,
        obscuringCharacter: "•",
        decoration: new InputDecoration(
            labelText: "Senha",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(0.0))),
            filled: true,
            fillColor: Color(corSenha)));

    TextButton btnLogin = new TextButton(
        onPressed: () {
          corAviso = Colors.transparent.value;
          if (fieldLogin.controller.text == "")
            corLogin = 0xFFE57373;
          else
            corLogin = 0xFFFFFFFF;

          if (fieldSenha.controller.text == "")
            corSenha = 0xFFE57373;
          else
            corSenha = 0xFFFFFFFF;

          if (fieldLogin.controller.text != "" &&
              fieldSenha.controller.text !=
                  "") if (funcLogin(
              fieldLogin.controller.text, fieldSenha.controller.text))
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => PgTelaIni()));
          else
            corAviso = Colors.red.value;
          setState(() {});
        },
        child: Container(
            alignment: AlignmentDirectional.center,
            height: (geralScale * 0.1),
            width: (geralScale * 0.4),
            decoration: BoxDecoration(color: Colors.black),
            child: Text("Entrar",
                textScaleFactor: geralScale * 0.006,
                style: TextStyle(color: Colors.white))));

    TextButton btnCadastrar = new TextButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => JanelaCadastro()));
        },
        child: Text("Cadastrar", textScaleFactor: (geralScale * 0.003)));

    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                child: Wrap(children: <Widget>[
      Container(
          width: (geralScale * 0.7),
          decoration: quadradoCentral,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(height: geralScale * 0.03),
                Text("Login", textScaleFactor: (geralScale * 0.011)),
                Container(height: geralScale * 0.05),
                Container(
                    height: (geralScale * 0.1),
                    width: (geralScale * 0.6),
                    child: fieldLogin),
                Container(height: geralScale * 0.02),
                Container(
                    height: (geralScale * 0.1),
                    width: (geralScale * 0.6),
                    child: fieldSenha),
                Container(height: (geralScale * 0.06), child: txtErro),
                btnLogin,
                btnCadastrar,
                Container(height: geralScale * 0.03)
              ]))
    ]))));
  }
}
