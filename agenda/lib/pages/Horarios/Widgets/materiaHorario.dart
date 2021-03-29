import 'package:agenda/models/horario.dart';
import 'package:agenda/models/materia.dart';
import 'package:agenda/pages/Horarios/Widgets/buildListTile.dart';
import 'package:agenda/repositories/eventsRepositorie.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MateriaHorario extends StatefulWidget {
  final String diaSemana;

  MateriaHorario({Key key, this.diaSemana}) : super(key: key);

  @override
  _MateriaHorarioState createState() => _MateriaHorarioState();
}

class _MateriaHorarioState extends State<MateriaHorario> {
  @override
  Widget build(BuildContext context) {
    return Consumer<EventsRepositorie>(builder: (context, repositorie, child) {
      List<Materia> materias = repositorie.materia;

      return ListView.builder(
        itemCount: materias.length,
        itemBuilder: (context, materia) {
          materias[materia].horarios.forEach((horario) {
            if (widget.diaSemana == horario.diaSemana) {
              return BuildListTile(
                materia: materias[materia],
                horario: horario,
              );
            }
          });

          return Container();
        },
      );
    });
  }
}
