import 'package:agenda/pages/Horarios/+h/pgplush.dart';
import 'package:flutter/material.dart';

import 'Widgets/materiaHorario.dart';

class Horarios extends StatefulWidget {
  @override
  _HorariosState createState() => _HorariosState();
}

class _HorariosState extends State<Horarios> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Horários',
            style: TextStyle(color: Colors.white),
          ),
          flexibleSpace: Container(),
          bottom: TabBar(
            labelColor: Colors.white,
            tabs: [
              Tab(
                text: 'Seg',
              ),
              Tab(
                text: 'Ter',
              ),
              Tab(
                text: 'Qua',
              ),
              Tab(
                text: 'Qui',
              ),
              Tab(
                text: 'Sex',
              ),
              Tab(
                text: 'Sab',
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Image(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              image: AssetImage("assets/background-tela-horarios.jpg"),
              alignment: Alignment.center,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
            TabBarView(
              children: [
                MateriaHorario(
                  diaSemana: 'seg',
                ),
                MateriaHorario(
                  diaSemana: 'ter',
                ),
                MateriaHorario(
                  diaSemana: 'qua',
                ),
                MateriaHorario(
                  diaSemana: 'qui',
                ),
                MateriaHorario(
                  diaSemana: 'sex',
                ),
                MateriaHorario(
                  diaSemana: 'sab',
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Janelona(),
              ),
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: Colors.white60,
        ),
      ),
    );
  }
}
