import 'package:agenda/pages/Calendario_eventos/pgcalendario.dart';
import 'package:agenda/pages/Horarios/pghorario.dart';
import 'package:flutter/material.dart';

import 'Widgets/complexContainer.dart';

class PgTelaIni extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<double> igreja = [
      30.0,
      57.0,
      65.0,
      58.0,
      55.0,
      53.0,
      80.0,
      80.0,
      78.0,
      75.0,
      48.0,
      45.0,
      43.0,
      40.0,
    ];
    final List<double> guilda = [
      80.0,
      100.0,
      99.0,
      99.0,
      100.0,
      100.0,
      100.0,
      100.0,
      100.0,
    ];
    return Scaffold(
      body: Stack(
        children: [
          Image(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            image: AssetImage("assets/background-tela-inicial.jpg"),
            alignment: Alignment.center,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .37,
            right: MediaQuery.of(context).size.width * .01,
            child: Container(
              height: MediaQuery.of(context).size.height * .43,
              width: MediaQuery.of(context).size.width * .35,
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Horarios(),
                    ),
                  );
                },
                child: Column(
                  children: [
                    ComplexContainer(
                      data: guilda,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .18,
            left: MediaQuery.of(context).size.width * .04,
            child: Container(
              height: MediaQuery.of(context).size.height * .35,
              width: MediaQuery.of(context).size.width * .58,
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => Calendario(),
                    ),
                  );
                },
                child: Column(
                  children: [
                    ComplexContainer(
                      data: igreja,
                    ),
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
