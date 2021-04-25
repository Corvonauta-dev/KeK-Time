import 'package:cloud_firestore/cloud_firestore.dart';

class Db {
  Db._();
  static final Db _instance = Db._();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static get() {
    return Db._instance._firestore;
  }
}
