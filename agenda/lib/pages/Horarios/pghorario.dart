import 'package:flutter/material.dart';

import 'Widgets/materiaHorario.dart';

class Horarios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.red,
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
      ),
    );
  }
}
