// import 'dart:ffi';

// import 'package:agenda/models/materia.dart';
// import 'package:agenda/repositories/materiaRepository.dart';
// import 'package:get/get.dart';

// class MateriaController extends GetxController {
//   //final MateriaRepository _materiaRepository;
//   var _materias = <Materia>[].obs;
//   MateriaController(this._materiaRepository);

//   List<Materia> get materias => _materias.toList();

//   @override
//   void onInit() {
//     //_changMaterias();
//     print('|----------------------------------------------------------|');
//     //print(_materiaRepository.materias);
//     print('|----------------------------------------------------------|');
//     super.onInit();
//   }

//   void _changMaterias() {
//     _materiaRepository.initRepository();
//     if (_materias.isEmpty) {
//       _materias.addAll(_materiaRepository.materias);
//     } else {
//       _materias.clear();
//       _materias.addAll(_materiaRepository.materias);
//     }
//   }
// }
