import 'package:flutter/material.dart';

class JanelaCadastro extends StatefulWidget {
  const JanelaCadastro({Key key}) : super(key: key);

  @override
  _JanelaCadastroState createState() => _JanelaCadastroState();
}

class _JanelaCadastroState extends State<JanelaCadastro> {
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
                Container(height: geralScale * 0.05),
                Text("Cadastro", textScaleFactor: (geralScale * 0.01)),
                Container(height: geralScale * 0.04),
                Container(
                    height: (geralScale * 0.09),
                    width: (geralScale * 0.6),
                    child: TextField(
                        decoration: (new InputDecoration(
                            labelText: "Nome",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0.0))),
                            filled: true,
                            fillColor: Colors.white)))),
                Container(height: geralScale * 0.02),
                Container(
                    height: (geralScale * 0.09),
                    width: (geralScale * 0.6),
                    child: TextField(
                        decoration: (new InputDecoration(
                            labelText: "Email",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0.0))),
                            filled: true,
                            fillColor: Colors.white)))),
                Container(height: geralScale * 0.02),
                Container(
                    height: (geralScale * 0.09),
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
                    height: (geralScale * 0.09),
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
                Container(height: geralScale * 0.05),
                TextButton(
                    onPressed: null,
                    child: Container(
                        alignment: AlignmentDirectional.center,
                        height: (geralScale * 0.1),
                        width: (geralScale * 0.35),
                        decoration: BoxDecoration(color: Colors.black),
                        child: Text("Enviar",
                            textScaleFactor: geralScale * 0.005,
                            style: TextStyle(color: Colors.white)))),
                Container(height: geralScale * 0.035)
              ]))
    ]))));
  }
}
