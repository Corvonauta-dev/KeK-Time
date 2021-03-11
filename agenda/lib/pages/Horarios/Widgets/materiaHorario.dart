import 'package:agenda/models/horario.dart';
import 'package:agenda/models/materia.dart';
import 'package:agenda/pages/Horarios/Widgets/buildListTile.dart';
import 'package:flutter/material.dart';

class MateriaHorario extends StatefulWidget {
  final String diaSemana;

  MateriaHorario({Key key, this.diaSemana}) : super(key: key);

  @override
  _MateriaHorarioState createState() => _MateriaHorarioState();
}

class _MateriaHorarioState extends State<MateriaHorario> {
  Materia materia = Materia(
    'Nome-0',
    [
      Horario('08:20', '09:10', 'seg'),
      Horario('08:20', '09:10', 'sex'),
      Horario('09:10', '10:00', 'seg')
    ],
  );

  @override
  Widget build(BuildContext context) {
    materia.horarios.map((e) => {});
    print(materia.horarios.map((e) => null));

    // for (int i = 0; i < materia.horarios.length; i++) {
    //   if (widget.diaSemana == materia.horarios[0].diaSemana) {}
    // }
    if (widget.diaSemana == materia.horarios[0].diaSemana) {
      return ListView(
        children: [
          BuildListTile(
            materia: materia,
          ),
        ],
      );
    }
    return Container();
  }
}
