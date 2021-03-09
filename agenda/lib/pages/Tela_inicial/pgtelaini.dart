import 'package:flutter/material.dart';

class PgTelaIni extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              color: Colors.red,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * .25,
            left: MediaQuery.of(context).size.width * .03,
            child: Container(
              height: MediaQuery.of(context).size.height * .285,
              width: MediaQuery.of(context).size.width * .1,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
