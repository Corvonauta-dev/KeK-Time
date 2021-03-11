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
      Horario('10:20', '11:10', 'sex'),
      Horario('09:10', '10:00', 'seg'),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: materia.horarios.length,
      itemBuilder: (context, index) {
        if (widget.diaSemana == materia.horarios[index].diaSemana) {
          return BuildListTile(
            materia: materia,
            index: index,
          );
        }
        return Container();
      },
    );
  }
}
