import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:agenda/services/autent_serv.dart';

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
TextEditingController ctrlNome = new TextEditingController();
TextEditingController ctrlEmail = new TextEditingController();
TextEditingController ctrlLogin = new TextEditingController();
TextEditingController ctrlSenha = new TextEditingController();

class _JanelaCadastroState extends State<JanelaCadastro> {
  @override
  Widget build(BuildContext context) {
    double totalWidth = MediaQuery.of(context).size.width;
    double totalHeight = MediaQuery.of(context).size.height;
    double geralScale = (totalWidth < totalHeight) ? totalWidth : totalHeight;

    RegExp expEmail = new RegExp("[a-zA-Z_0-9]+@[a-z]+([\.]{1}[a-z]+)+");

    Text txtErro = new Text(txtAviso,
        textScaleFactor: (geralScale * 0.003),
        style: new TextStyle(color: Color(corAviso)));

    TextField fieldNome = new TextField(
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]+"))
        ],
        controller: ctrlNome,
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
        controller: ctrlEmail,
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
        controller: ctrlLogin,
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
        controller: ctrlSenha,
        obscureText: true,
        obscuringCharacter: "•",
        decoration: new InputDecoration(
            labelText: "Senha",
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(0.0))),
            filled: true,
            fillColor: Color(corSenha)));

    void cadastroDb() {
      //AutentServ.to.user.uid
      var _db = FirebaseFirestore.instance;
      String userID = AutentServ.to.user.uid;

      var _ref = _db
          .collection('Usuarios')
          .doc(userID)
          .set({'nome': ctrlNome.text, 'usuario': ctrlLogin.text});
    }

    void funcCadastro(
        String nome, String email, String login, String senha) async {
      await AutentServ.to.criarUsuario(email, senha);
      txtAviso = AutentServ.to.pegarRetorno();
      if (txtAviso == "ok") {
        txtAviso = "Cadastrado";
        corAviso = Colors.blue.value;
        cadastroDb();
      } else {
        corAviso = Colors.red.value;
      }
      setState(() {});
    }

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
              funcCadastro(
                  fieldNome.controller.text,
                  fieldEmail.controller.text,
                  fieldLogin.controller.text,
                  fieldSenha.controller.text);
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
