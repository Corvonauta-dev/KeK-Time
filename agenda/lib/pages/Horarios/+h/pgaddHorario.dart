import 'package:agenda/models/horario.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';

class AddHorario extends StatefulWidget {
  ValueChanged<Horario> onSave;
  AddHorario({
    Key key,
    this.onSave,
  }) : super(key: key);

  @override
  _AddHorarioState createState() => _AddHorarioState();
}

class _AddHorarioState extends State<AddHorario> {
  Horario _horario;

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

  List<DropdownMenuItem<String>> _dropDownMenuItens;
  String _status;

  List<DropdownMenuItem<String>> _getDropDownMenuItems() {
    List<DropdownMenuItem<String>> itens = [];
    itens.add(DropdownMenuItem(
      value: 'seg',
      child: Text('SEG'),
    ));
    itens.add(DropdownMenuItem(
      value: 'ter',
      child: Text('TER'),
    ));
    itens.add(DropdownMenuItem(
      value: 'qua',
      child: Text('QUA'),
    ));
    itens.add(DropdownMenuItem(
      value: 'qui',
      child: Text('QUI'),
    ));
    itens.add(DropdownMenuItem(
      value: 'sex',
      child: Text('SEX'),
    ));
    itens.add(DropdownMenuItem(
      value: 'sab',
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
              _horario = Horario(
                  diaSemana: _status,
                  horarioInicio: _timeInicio.format(context),
                  horarioFim: _timeFim.format(context));
              widget.onSave(_horario);
              Navigator.pop(context);
            },
          )
        ],
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Add Horario",
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
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
              SingleChildScrollView(
                child: DropdownButton(
                  dropdownColor: Colors.black,
                  style: TextStyle(color: Colors.white),
                  value: _status,
                  items: _dropDownMenuItens,
                  onChanged: (String value) {
                    changedDropDownItens(value);
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
                        style: TextStyle(color: Colors.white, fontSize: 52),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Horario Inicio',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 15),
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
                        style: TextStyle(color: Colors.white, fontSize: 52),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'Horario Fim',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 15),
              )
            ],
          ),
        ],
      ),
    );
  }
}
