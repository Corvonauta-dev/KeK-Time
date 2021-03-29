import 'package:agenda/models/horario.dart';
import 'package:agenda/pages/Horarios/+h/buildListTile.dart';
import 'package:agenda/repositories/eventsRepositorie.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
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

  TimeOfDay _timeInicio = TimeOfDay.now().replacing(minute: 30);

  void onTimeChangedInicio(TimeOfDay newTime) {
    setState(() {
      _timeInicio = newTime;
    });
  }

  TimeOfDay _timeFim = TimeOfDay.now().replacing(minute: 30);

  void onTimeChangedFim(TimeOfDay newTime) {
    setState(() {
      _timeFim = newTime;
    });
  }

  save() {
    Provider.of<EventsRepositorie>(context, listen: false)
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

  List<DropdownMenuItem<String>> _dropDownMenuItens;
  String _status;

  List<DropdownMenuItem<String>> _getDropDownMenuItems() {
    List<DropdownMenuItem<String>> itens = [];
    itens.add(DropdownMenuItem(
      value: 'SEG',
      child: Text('SEG'),
    ));
    itens.add(DropdownMenuItem(
      value: 'TER',
      child: Text('TER'),
    ));
    itens.add(DropdownMenuItem(
      value: 'QUA',
      child: Text('QUA'),
    ));
    itens.add(DropdownMenuItem(
      value: 'QUI',
      child: Text('QUI'),
    ));
    itens.add(DropdownMenuItem(
      value: 'SEX',
      child: Text('SEX'),
    ));
    itens.add(DropdownMenuItem(
      value: 'SAB',
      child: Text('SAB'),
    ));

    return itens;
  }

  @override
  void initState() {
    _dropDownMenuItens = _getDropDownMenuItems();
    _status = _dropDownMenuItens[0].value;
    super.initState();
  }

  void changedDropDownItens(String selectedItem) {
    setState(() {
      _status = selectedItem;
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
                                return "Por Favor Digite o Nome do Evento";
                              }
                              return null;
                            },
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * .7,
                          color: Colors.red,
                          child: ListView.builder(
                              itemCount: _horarios.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20),
                                      child: BuildListTile(
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
          createAlertDialog();
        },
        child: Icon(
          Icons.alarm_add,
          color: Colors.black,
        ),
        backgroundColor: Colors.white30,
      ),
    );
  }

  createAlertDialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Add Horario'),
            content: Column(
              children: [
                SingleChildScrollView(
                  child: DropdownButton(
                    value: _status,
                    items: _dropDownMenuItens,
                    onChanged: (String value) {
                      setState(() {
                        _status = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            showPicker(
                              context: context,
                              value: _timeInicio,
                              onChange: onTimeChangedInicio,
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
                          _timeInicio.format(context),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 52),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Horario Inicio',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            showPicker(
                              context: context,
                              value: _timeFim,
                              onChange: onTimeChangedFim,
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
                          _timeFim.format(context),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 52),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Horario Fim',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 15),
                )
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Add'),
                onPressed: () {
                  setState(() {
                    _horarios.add(Horario(_timeInicio.format(context),
                        _timeFim.format(context), _status));
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
