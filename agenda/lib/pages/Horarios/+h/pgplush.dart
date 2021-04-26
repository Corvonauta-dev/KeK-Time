import 'package:agenda/models/horario.dart';
import 'package:agenda/pages/Horarios/+h/buildListTile.dart';
import 'package:agenda/pages/Horarios/+h/pgaddHorario.dart';
import 'package:agenda/services/autent_serv.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Janelona extends StatefulWidget {
  @override
  _JanelonaState createState() => _JanelonaState();
}

class _JanelonaState extends State<Janelona> {
  final TextEditingController _nomeEventoController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<Horario> _horarios = [];

  save() {
    var _db = FirebaseFirestore.instance;
    String userID = AutentServ.to.user.uid;
    List<Map<String, String>> _horariosDb = [];
    _horarios.forEach((horario) {
      _horariosDb.add({
        'diaSemana': horario.diaSemana,
        'horarioFim': horario.horarioFim,
        'horarioInicio': horario.horarioInicio
      });
    });
    var _ref = _db
        .collection('Usuarios')
        .doc(userID)
        .collection('Materias')
        .add({'nome': _nomeEventoController.text, 'horarios': _horariosDb});
    Get.back();
    Get.snackbar(
      'Sucesso!',
      'Materia cadastrada!',
      backgroundColor: Colors.grey[900],
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  addHorario(Horario horario) {
    setState(() {
      _horarios.add(horario);
    });
  }

  delHorario(Horario horario) {
    setState(() {
      _horarios.remove(horario);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                save();
                Navigator.pop(context);
              }
            },
          )
        ],
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Add Materia",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Image(
            image: AssetImage("assets/calendario.jpg"),
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 10, top: 100.0, left: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: TextFormField(
                            controller: _nomeEventoController,
                            style: TextStyle(color: Colors.white),
                            keyboardType: TextInputType.name,
                            textCapitalization: TextCapitalization.words,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                                borderSide: BorderSide(
                                  color: Colors.grey,
                                ),
                              ),
                              labelText: 'Nome da Materia',
                              labelStyle:
                                  TextStyle(color: Colors.white, fontSize: 12),
                              filled: true,
                              fillColor: Colors.grey[800].withOpacity(.8),
                            ),
                            validator: (String value) {
                              if (value.isEmpty) {
                                return "Por Favor Digite o Nome da Materia";
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .7,
                          color: Colors.transparent,
                          child: ListView.builder(
                              itemCount: _horarios.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: BuildListTile(
                                        delHorario: this.delHorario,
                                        horario: _horarios[index],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  AddHorario(onSave: this.addHorario),
            ),
          );
        },
        child: Icon(
          Icons.alarm_add,
          color: Colors.black,
        ),
        backgroundColor: Colors.white30,
      ),
    );
  }
}
