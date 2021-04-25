import 'package:agenda/repositories/eventsRepositorie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:provider/provider.dart';

class Janelinha extends StatefulWidget {
  final String dia;
  final String mes;

  const Janelinha({Key key, this.dia, this.mes}) : super(key: key);

  @override
  _JanelinhaState createState() => _JanelinhaState();
}

class _JanelinhaState extends State<Janelinha> {
  final TextEditingController _nomeEventoController = TextEditingController();

  final TextEditingController _horarioEventoController =
      TextEditingController();

  final TextEditingController _descriptionEventoController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TimeOfDay _time = TimeOfDay.now().replacing(minute: 30);

  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
    });
  }

  save() {
    // Provider.of<EventsRepositorie>(context, listen: false).addEvento(
    //     titulo: _nomeEventoController.text,
    //     horario: _time.format(context),
    //     description: _descriptionEventoController.text,
    //     dia: widget.dia,
    //     mes: widget.mes);
    var _db = FirebaseFirestore.instance;
    String userID = '84nMqy2PvegP57q1kqbB';

    var _ref =
        _db.collection('Usuarios').doc(userID).collection('Eventos').add({
      'titulo': _nomeEventoController.text,
      'horario': _time.format(context),
      'description': _descriptionEventoController.text,
      'dia': widget.dia,
      'mes': widget.mes
    });
    Get.back();
    Get.snackbar(
      'Sucesso!',
      'Evento cadastrado!',
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
            padding: const EdgeInsets.only(top: 120.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      showPicker(
                        context: context,
                        value: _time,
                        onChange: onTimeChanged,
                        minuteInterval: MinuteInterval.FIVE,
                        disableHour: false,
                        disableMinute: false,
                        minMinute: 7,
                        maxMinute: 56,
                        // Optional onChange to receive value as DateTime
                        onChangeDateTime: (DateTime dateTime) {
                          print(dateTime);
                        },
                      ),
                    );
                  },
                  child: Text(
                    _time.format(context),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 52),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 200.0, left: 10),
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
                        labelText: 'Nome do Evento',
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 12),
                        filled: true,
                        fillColor: Colors.grey[800].withOpacity(.8),
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
                      controller: _descriptionEventoController,
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
                        labelText: 'Descrição do Evento',
                        labelStyle:
                            TextStyle(color: Colors.white, fontSize: 12),
                        filled: true,
                        fillColor: Colors.grey[800].withOpacity(.8),
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
          Icons.check,
          color: Colors.black,
        ),
        backgroundColor: Colors.white30,
      ),
    );
  }
}
