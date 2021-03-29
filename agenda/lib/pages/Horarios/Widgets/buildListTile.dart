import 'package:agenda/models/horario.dart';
import 'package:agenda/models/materia.dart';
import 'package:agenda/pages/Horarios/hEdit/pgHorarioEdit.dart';
import 'package:flutter/material.dart';

class BuildListTile extends StatelessWidget {
  final Materia materia;
  final Horario horario;

  const BuildListTile({Key key, this.materia, this.horario}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => HorarioEdit(
              materia: materia,
            ),
          ),
        );
      },
      leading: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
            style: TextStyle(
              fontFamily: "Times New Roman",
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
              shadows: <Shadow>[
                Shadow(
                    offset: Offset(3.0, 2.0),
                    blurRadius: 3.0,
                    color: Colors.black54),
              ],
            ),
            children: [
              TextSpan(text: horario.horarioInicio),
              TextSpan(text: '\n'),
              TextSpan(text: horario.horarioFim)
            ]),
      ),
      title: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          style: TextStyle(
            fontFamily: "Times New Roman",
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            shadows: <Shadow>[
              Shadow(
                  offset: Offset(3.0, 2.0),
                  blurRadius: 3.0,
                  color: Colors.black54),
            ],
          ),
          children: [
            TextSpan(text: materia.nome),
          ],
        ),
      ),
    );
  }
}
