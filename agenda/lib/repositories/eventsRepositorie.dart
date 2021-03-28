
import 'dart:collection';

import 'package:agenda/models/evento.dart';
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
}
