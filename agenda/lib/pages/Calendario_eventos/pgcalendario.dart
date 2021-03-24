import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
//
//     __
//   <(o )___
//    ( ._> /
//     `---'~~~~~~~~~~~~~~~~~~~~~~~
//

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
          "Calendar",
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
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(6),
//                gradient: LinearGradient(colors: [Colors.red[400], Colors.red[300]]),
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
                      headerStyle: HeaderStyle(
                        titleTextStyle: TextStyle(color: Colors.white),
                        rightChevronVisible: false,
                        leftChevronVisible: false,
                        centerHeaderTitle: true,
                      ),
                      calendarController: _controller,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
