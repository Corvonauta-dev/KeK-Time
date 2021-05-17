import 'package:agenda/pages/Calendario_eventos/pgcalendario.dart';
import 'package:agenda/pages/Horarios/pghorario.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

import 'Widgets/complexContainer.dart';

class PgTelaIni extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<double> igreja = [
      0,
      10.0,
      15.0,
      28.0,
      40.0,
      58.0,
      85.0,
      75.0,
      100.0,
      70.0,
      75.0,
      50.0,
      40.0,
      30.0,
      25.0,
      10.0,
      5.0,
    ];
    final List<double> guilda = [
      45.0,
      67.0,
      70.0,
      73.0,
      98.0,
      100.0,
      100.0,
      100.0,
      100.0,
      95.0,
      70.0,
      65.0,
      60.0,
    ];
    return Scaffold(
      body: Stack(
        children: [
          Image(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            image: AssetImage("assets/telaInicial.gif"),
            alignment: Alignment.center,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .485,
            right: MediaQuery.of(context).size.width * .01,
            child: Container(
              height: MediaQuery.of(context).size.height * .295,
              width: MediaQuery.of(context).size.width * .67,
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
            top: MediaQuery.of(context).size.height * .03,
            left: MediaQuery.of(context).size.width * .03,
            child: Container(
              height: MediaQuery.of(context).size.height * .45,
              width: MediaQuery.of(context).size.width * .62,
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
          Positioned(
            top: MediaQuery.of(context).size.height * .81,
            left: MediaQuery.of(context).size.width * .3,
            child: Container(
              height: MediaQuery.of(context).size.height * .11,
              width: MediaQuery.of(context).size.width * .07,
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Share.share(
                      "Venha conhecer e se organizar com o nosso aplicativo KeK Time para sempre estar em dia com a sua programação universitária! \nhttps://drive.google.com/file/d/1LaKYcUbOU4nNXYwomiM_8YC2bFjO2BTa/view?usp=sharing");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
