// import 'dart:collection';

// import 'package:agenda/database/db.dart';
// import 'package:agenda/models/horario.dart';
// import 'package:agenda/models/materia.dart';

// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:get/get.dart';

// class MateriaRepository {
//   RxList _materias = [].obs;

//   MateriaRepository() {
//     initRepository();
//   }

//   List<Materia> get materias => _materias.toList();
//   initRepository() async {
//     FirebaseFirestore db = await Db.get();

//     var snapshot = await db
//         .collection("Usuarios")
//         .doc('84nMqy2PvegP57q1kqbB')
//         .collection('Materias')
//         .get();

//     snapshot.docs.forEach((doc) {
//       final data = doc.data();
//       List<Horario> h = [];
//       // print('saldkasdjasdjaskdasda-sa-ds-dsa-d-aspdsakdsa-d-asf-as-dask');
//       // print(data['horarios']);
//       data['horarios'].forEach((horario) {
//         h.add(Horario(
//             diaSemana: horario['diaSemana'],
//             horarioInicio: horario['horarioInicio'],
//             horarioFim: horario['horarioFim']));
//       });
//       // print('ksakdkasadskdaskkadskdas asdkaskdaskadskadskads');
//       // print(horarios[0].diaSemana);
//       _materias.add(Materia(nome: data['nome'], id: doc.id, horarios: h));
//     });

//     //print(materias[0].horarios[0].diaSemana);
//   }
// }
