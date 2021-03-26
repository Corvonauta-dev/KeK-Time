import 'dart:collection';

import 'package:agenda/models/horario.dart';
import 'package:agenda/models/materia.dart';
import 'package:flutter/material.dart';

class MateriaRepositorie extends ChangeNotifier {
  List<Materia> _materia = [];
  UnmodifiableListView<Materia> get materia => UnmodifiableListView(_materia);

  void addMateria({
    String nome,
    List<Horario> horarios,
  }) {
    Materia auxiliar = Materia(nome, horarios);
    _materia.add(auxiliar);
    notifyListeners();
  }
}
