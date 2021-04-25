import 'package:agenda/models/evento.dart';
import 'package:agenda/pages/Calendario_eventos/+c/janelinha.dart';
import 'package:agenda/repositories/eventsRepositorie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
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

  TextEditingController _nomeEventoController;
  TextEditingController _horarioEventoController;
  TextEditingController _descriptionEventoController;

  var _db = FirebaseFirestore.instance;
  String userID = '84nMqy2PvegP57q1kqbB';

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _nomeEventoController = TextEditingController();
    _horarioEventoController = TextEditingController();
    _descriptionEventoController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
                        child: StreamBuilder(
                            stream: _db
                                .collection('Usuarios')
                                .doc(userID)
                                .collection('Eventos')
                                .orderBy('dia')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                final List<DocumentSnapshot> eventos =
                                    snapshot.data.docs;

                                return ListView.builder(
                                  itemCount: eventos.length,
                                  itemBuilder: (context, evento) {
                                    String data =
                                        eventos[evento].data()['dia'] +
                                            '/' +
                                            eventos[evento].data()['mes'];
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        ListTile(
                                          leading: Column(
                                            children: [
                                              Text(
                                                data,
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              Text(
                                                eventos[evento]
                                                    .data()['horario'],
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                          title: Text(
                                            eventos[evento].data()['titulo'],
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          subtitle: Text(
                                            eventos[evento]
                                                .data()['description'],
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else if (snapshot.hasError) {
                                return Text('It s Error!');
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Janelinha(
                dia: _controller.selectedDay.day.toString(),
                mes: _controller.selectedDay.month.toString(),
              ),
            ),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.white30,
      ),
    );
  }

//   ListView buildListView() {
//     return;
//   }
}

//     __
//   <(o )___
//    ( ._> /
//     `---'~~~~~~~~~~~~~~~~~
