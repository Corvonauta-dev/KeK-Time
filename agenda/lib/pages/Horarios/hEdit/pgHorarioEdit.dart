import 'package:agenda/models/materia.dart';
import 'package:flutter/material.dart';

class HorarioEdit extends StatelessWidget {
  final Materia materia;

  const HorarioEdit({Key key, this.materia}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          materia.nome,
          style: TextStyle(color: Colors.white),
        ),
        flexibleSpace: Container(),
      ),
      body: Stack(
        children: [
          Image(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            image: AssetImage("assets/background-tela-horarios-edit.jpg"),
            alignment: Alignment.center,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
          ListView(
            children: [],
          ),
        ],
      ),
    );
  }
}
