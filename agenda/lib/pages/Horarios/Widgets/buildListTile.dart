import 'package:agenda/models/materia.dart';
import 'package:flutter/material.dart';

class BuildListTile extends StatelessWidget {
  final Materia materia;
  final int index;

  const BuildListTile({Key key, this.materia, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
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
              TextSpan(text: materia.horarios[index].horarioInicio),
              TextSpan(text: '\n'),
              TextSpan(text: materia.horarios[index].horarioFim)
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
