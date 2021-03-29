import 'dart:collection';

import 'package:agenda/models/evento.dart';
import 'package:agenda/models/horario.dart';
import 'package:agenda/models/materia.dart';
import 'package:flutter/material.dart';

class EventsRepositorie extends ChangeNotifier {
  List<Evento> _evento = [];
  UnmodifiableListView<Evento> get evento => UnmodifiableListView(_evento);

  void addEvento({
    String titulo,
    String horario,
    String description,
    String dia,
    String mes,
  }) {
    Evento auxiliar = Evento(titulo, horario, description, dia, mes);
    _evento.add(auxiliar);
    notifyListeners();
  }

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
