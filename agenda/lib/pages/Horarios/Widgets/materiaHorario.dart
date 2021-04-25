import 'package:agenda/models/materia.dart';
import 'package:agenda/pages/Horarios/Widgets/buildListTile.dart';
import 'package:flutter/material.dart';

class MateriaHorario extends StatelessWidget {
  final String diaSemana;
  final List<Materia> materias;

  const MateriaHorario({Key key, this.diaSemana, this.materias})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: materias.length,
      itemBuilder: (context, materia) {
        return BuildListTile(
          nome: materias[materia].nome,
          horario: materias[materia].horarios,
        );
      },
    );
  }
}
