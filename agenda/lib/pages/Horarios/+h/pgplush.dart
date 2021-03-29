import 'package:agenda/models/horario.dart';
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  List<Horario> _horarios = [];

  save() {
    Provider.of<MateriaRepositorie>(context, listen: false)
        .addMateria(nome: _nomeEventoController.text, horarios: _horarios);

    Get.back();
    Get.snackbar(
      'Sucesso!',
      'Materia cadastrada!',
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
          // Padding(
          //   padding: const EdgeInsets.only(top: 120.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       InkWell(
          //         onTap: () {
          //           Navigator.of(context).push(
          //             showPicker(
          //               context: context,
          //               value: _time,
          //               onChange: onTimeChanged,
          //               minuteInterval: MinuteInterval.FIVE,
          //               disableHour: false,
          //               disableMinute: false,
          //               minMinute: 7,
          //               maxMinute: 56,
          //               // Optional onChange to receive value as DateTime
          //               onChangeDateTime: (DateTime dateTime) {
          //                 print(dateTime);
          //               },
          //             ),
          //           );
          //         },
          //         child: Text(
          //           _time.format(context),
          //           textAlign: TextAlign.center,
          //           style: TextStyle(color: Colors.white, fontSize: 52),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 100.0, left: 10),
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
                              return "Por Favor Digite o Nome do Evento";
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * .7,
                        color: Colors.white,
                        child: ListView.builder(
                            itemCount: 2,
                            itemBuilder: (context, snapshot) {
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: ListTile(
                                      title: Center(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .15,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .15,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(30),
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Icon(Icons.add_alarm),
                                        ),
                                      ),
                                      subtitle: Center(
                                        child: Text(
                                          'add horario',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
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
