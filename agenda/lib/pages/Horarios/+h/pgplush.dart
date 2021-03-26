
import 'package:agenda/repositories/materiaRepositories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Janelona extends StatefulWidget {
  @override
  _JanelonaState createState() => _JanelonaState();
}

class _JanelonaState extends State<Janelona> {
  final TextEditingController _nomeEventoController = TextEditingController();

  final TextEditingController _horarioEventoController =
      TextEditingController();

  final TextEditingController _descriptionEventoController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  save() {
    Provider.of<MateriaRepositorie>(context, listen: false).addMateria();

    Get.back();
    Get.snackbar(
      'Sucesso!',
      'Titulo cadastrado!',
      backgroundColor: Colors.grey[900],
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Add Evento",
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
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: _nomeEventoController,
                      style: TextStyle(color: Colors.green[700]),
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.green[700],
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
                            color: Colors.greenAccent[400],
                          ),
                        ),
                        labelText: 'Nome do Evento',
                        labelStyle:
                            TextStyle(color: Colors.green[700], fontSize: 12),
                        filled: true,
                        fillColor: Colors.green[50],
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Por Favor Digite o Nome do Evento";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: _horarioEventoController,
                      style: TextStyle(color: Colors.green[700]),
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.green[700],
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
                            color: Colors.greenAccent[400],
                          ),
                        ),
                        labelText: 'Horario do Evento',
                        labelStyle:
                            TextStyle(color: Colors.green[700], fontSize: 12),
                        filled: true,
                        fillColor: Colors.green[50],
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Por Favor Digite o Horario do Evento";
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: _descriptionEventoController,
                      style: TextStyle(color: Colors.green[700]),
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.green[700],
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
                            color: Colors.greenAccent[400],
                          ),
                        ),
                        labelText: 'Descrição do Evento',
                        labelStyle:
                            TextStyle(color: Colors.green[700], fontSize: 12),
                        filled: true,
                        fillColor: Colors.green[50],
                      ),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return "Por Favor Digite a descrição do Evento";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            save();
            Navigator.pop(context);
          }
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.white30,
      ),
    );
  }
}
