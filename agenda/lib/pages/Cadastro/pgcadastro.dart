import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class JanelaCadastro extends StatefulWidget {
  const JanelaCadastro({Key key}) : super(key: key);
  @override
  _JanelaCadastroState createState() => _JanelaCadastroState();
}

int corNome = Colors.white.value;
int corEmail = Colors.white.value;
int corLogin = Colors.white.value;
int corSenha = Colors.white.value;
int corAviso = Colors.transparent.value;
String txtAviso = "Deu ruim";

class _JanelaCadastroState extends State<JanelaCadastro> {
  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double totalHeight = MediaQuery.of(context).size.height;
    double geralScale = (totalWidth < totalHeight) ? totalWidth : totalHeight;

    RegExp expEmail = new RegExp("[a-zA-Z_0-9]+@[a-z]+([\.]{1}[a-z]+)+");

    String funcCadastro(String nome, String email, String login, String senha) {
      //"MACHINES" - Morpheus, 2199
      return "Retornar problemas";
    }

    Text txtErro = new Text(txtAviso,
        textScaleFactor: (geralScale * 0.003),
        style: new TextStyle(color: Color(corAviso)));

    TextField fieldNome = new TextField(
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]+"))
        ],
        controller: new TextEditingController(),
        decoration: new InputDecoration(
            labelText: "Nome",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(0.0))),
            filled: true,
            fillColor: Color(corNome)));

    TextField fieldEmail = new TextField(
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.deny(RegExp("[\",/\\\\]"))
        ],
        controller: new TextEditingController(),
        decoration: new InputDecoration(
            labelText: "Email",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(0.0))),
            filled: true,
            fillColor: Color(corEmail)));

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

    TextButton btnCadastrar = new TextButton(
        onPressed: () {
          corAviso = Colors.transparent.value;
          (fieldNome.controller.text == "")
              ? corNome = 0xFFE57373
              : corNome = 0xFFFFFFFF;
          (fieldEmail.controller.text == "")
              ? corEmail = 0xFFE57373
              : corEmail = 0xFFFFFFFF;
          (fieldLogin.controller.text == "")
              ? corLogin = 0xFFE57373
              : corLogin = 0xFFFFFFFF;
          (fieldSenha.controller.text == "")
              ? corSenha = 0xFFE57373
              : corSenha = 0xFFFFFFFF;

          if (expEmail.hasMatch(fieldEmail.controller.text) &&
              (fieldEmail.controller.text ==
                  expEmail.stringMatch(fieldEmail.controller.text))) {
            if (fieldNome.controller.text != "" &&
                fieldLogin.controller.text != "" &&
                fieldSenha.controller.text != "") {
              txtAviso = funcCadastro(
                  fieldNome.controller.text,
                  fieldEmail.controller.text,
                  fieldLogin.controller.text,
                  fieldSenha.controller.text);
              if (txtAviso == "")
                print("Cadastrado");
              else
                corAviso = Colors.red.value;
            }
          } else
            corEmail = 0xFFE57373;

          setState(() {});
        },
        child: Container(
            alignment: AlignmentDirectional.center,
            height: (geralScale * 0.1),
            width: (geralScale * 0.35),
            decoration: BoxDecoration(color: Colors.black),
            child: Text("Enviar",
                textScaleFactor: geralScale * 0.005,
                style: TextStyle(color: Colors.white))));

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
                Container(height: geralScale * 0.05),
                Text("Cadastro", textScaleFactor: (geralScale * 0.01)),
                Container(height: geralScale * 0.04),
                Container(
                    height: (geralScale * 0.09),
                    width: (geralScale * 0.6),
                    child: fieldNome),
                Container(height: geralScale * 0.02),
                Container(
                    height: (geralScale * 0.09),
                    width: (geralScale * 0.6),
                    child: fieldEmail),
                Container(height: geralScale * 0.02),
                Container(
                    height: (geralScale * 0.09),
                    width: (geralScale * 0.6),
                    child: fieldLogin),
                Container(height: geralScale * 0.02),
                Container(
                    height: (geralScale * 0.09),
                    width: (geralScale * 0.6),
                    child: fieldSenha),
                Container(height: (geralScale * 0.05), child: txtErro),
                btnCadastrar,
                Container(height: geralScale * 0.035)
              ]))
    ]))));
  }
}
