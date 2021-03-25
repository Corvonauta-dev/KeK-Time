import 'dart:core';
//import 'dart:html';

//import 'package:google_fonts/google_fonts.dart';
//import 'package:provider/provider.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:agenda/models/evento.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendario extends StatefulWidget {
  @override
  _Calendario createState() => _Calendario();
}

class _Calendario extends State<Calendario> {
  CalendarController _controller;
  TextStyle dayStyle(FontWeight fontWeight) {
    return TextStyle(color: Colors.white, fontWeight: fontWeight);
  }

  TextStyle wdStyle(FontWeight fontWeight) {
    return TextStyle(color: Colors.red[500], fontWeight: fontWeight);
  }

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  List<Evento> _evento = [
    Evento(
      'evento 1',
      '13:50',
      'aqui vai a descricao do evento 1',
    ),
    Evento(
      'evento 2',
      '15:50',
      'aqui vai a descricao do evento 2',
    ),
    Evento(
      'evento 3',
      '14:20',
      'aqui vai a descricao do evento 3',
    ),
    Evento(
      'evento 4',
      '16:20',
      'aqui vai a descricao do evento 4',
    ),
    Evento(
      'evento 5',
      '18:20',
      'aqui vai a descricao do evento 5',
    ),
    Evento(
      'evento 6',
      '20:20',
      'aqui vai a descricao do evento 6',
    ),
  ];

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
          "Calendario",
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
            padding: const EdgeInsets.only(top: 75),
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5,
                        offset: new Offset(0.0, 5))
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    TableCalendar(
                      calendarStyle: CalendarStyle(
                        canEventMarkersOverflow: true,
                        markersColor: Colors.transparent,
                        todayColor: Colors.transparent,
                        todayStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        selectedColor: Colors.brown[700],
                        outsideWeekendStyle: TextStyle(color: Colors.white60),
                        outsideStyle: TextStyle(color: Colors.white60),
                        renderDaysOfWeek: false,
                        weekdayStyle: dayStyle(FontWeight.normal),
                        weekendStyle: wdStyle(FontWeight.normal),
                      ),
                      daysOfWeekStyle: DaysOfWeekStyle(
                          weekdayStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          weekendStyle: TextStyle(
                              color: Colors.red[500],
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                          dowTextBuilder: (date, locale) {
                            return DateFormat.E(locale)
                                .format(date)
                                .substring(0, 1);
                          }),
                      headerStyle: HeaderStyle(
                        titleTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          //fontStyle: FontStyle.italic
                        ),
                        //rightChevronVisible: false,
                        //leftChevronVisible: false,
                        centerHeaderTitle: true,
                      ),
                      calendarController: _controller,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.45,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(.1),
                          borderRadius: BorderRadius.only(
                            topRight: const Radius.circular(20),
                            topLeft: const Radius.circular(20),
                            bottomLeft: const Radius.circular(20),
                            bottomRight: const Radius.circular(20),
                          ),
                        ),
                        child: buildListView(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                color: Colors.black,
                height: 180,
                child: Container(
                  child: _buildColumn(),
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(20),
                      topRight: const Radius.circular(20),
                    ),
                  ),
                ),
              );
            }),
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.white30,
      ),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      itemCount: _evento.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            ListTile(
              leading: Text(
                _evento[index].horario,
                style: TextStyle(color: Colors.white),
              ),
              title: Text(
                _evento[index].titulo,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                _evento[index].description,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  Column _buildColumn() {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text('Adicionar Evento'),
          onTap: () => _tap('addEvent'),
        ),
      ],
    );
  }

  void _tap(String name) {
    Navigator.pop(context);
  }
}

//     __
//   <(o )___
//    ( ._> /
//     `---'~~~~~~~~~~~~~~~~~
