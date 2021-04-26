import 'package:agenda/models/horario.dart';
import 'package:agenda/models/materia.dart';
import 'package:agenda/pages/Horarios/+h/pgplush.dart';
import 'package:agenda/services/autent_serv.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Widgets/materiaHorario.dart';

class Horarios extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _db = FirebaseFirestore.instance;
    String userID = AutentServ.to.user.uid;
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
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
            StreamBuilder(
                stream: _db
                    .collection('Usuarios')
                    .doc(userID)
                    .collection('Materias')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final List<DocumentSnapshot> materias = snapshot.data.docs;
                    final List<Materia> seg = [];
                    final List<Materia> ter = [];
                    final List<Materia> qua = [];
                    final List<Materia> qui = [];
                    final List<Materia> sex = [];
                    final List<Materia> sab = [];
                    materias.forEach((materia) {
                      materia.data()['horarios'].forEach((horario) {
                        switch (horario['diaSemana']) {
                          case 'seg':
                            seg.add(Materia(
                                nome: materia.data()['nome'],
                                horarios: Horario(
                                    diaSemana: horario['diaSemana'],
                                    horarioInicio: horario['horarioInicio'],
                                    horarioFim: horario['horarioInicio'])));
                            break;
                          case 'ter':
                            ter.add(Materia(
                                nome: materia.data()['nome'],
                                horarios: Horario(
                                    diaSemana: horario['diaSemana'],
                                    horarioInicio: horario['horarioInicio'],
                                    horarioFim: horario['horarioInicio'])));
                            break;
                          case 'qua':
                            qua.add(Materia(
                                nome: materia.data()['nome'],
                                horarios: Horario(
                                    diaSemana: horario['diaSemana'],
                                    horarioInicio: horario['horarioInicio'],
                                    horarioFim: horario['horarioInicio'])));
                            break;
                          case 'qui':
                            qui.add(Materia(
                                nome: materia.data()['nome'],
                                horarios: Horario(
                                    diaSemana: horario['diaSemana'],
                                    horarioInicio: horario['horarioInicio'],
                                    horarioFim: horario['horarioInicio'])));
                            break;
                          case 'sex':
                            sex.add(Materia(
                                nome: materia.data()['nome'],
                                horarios: Horario(
                                    diaSemana: horario['diaSemana'],
                                    horarioInicio: horario['horarioInicio'],
                                    horarioFim: horario['horarioInicio'])));
                            break;
                          case 'sab':
                            sab.add(Materia(
                                nome: materia.data()['nome'],
                                horarios: Horario(
                                    diaSemana: horario['diaSemana'],
                                    horarioInicio: horario['horarioInicio'],
                                    horarioFim: horario['horarioInicio'])));
                            break;
                        }
                      });
                    });
                    return TabBarView(
                      children: [
                        MateriaHorario(
                          materias: seg,
                          diaSemana: 'seg',
                        ),
                        MateriaHorario(
                          materias: ter,
                          diaSemana: 'ter',
                        ),
                        MateriaHorario(
                          materias: qua,
                          diaSemana: 'qua',
                        ),
                        MateriaHorario(
                          materias: qui,
                          diaSemana: 'qui',
                        ),
                        MateriaHorario(
                          materias: sex,
                          diaSemana: 'sex',
                        ),
                        MateriaHorario(
                          materias: sab,
                          diaSemana: 'sab',
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('It s Error!');
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Janelona(),
              ),
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
          backgroundColor: Colors.white60,
        ),
      ),
    );
  }
}
