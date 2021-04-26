import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AutentServ extends GetxController {
  FirebaseAuth _autent = FirebaseAuth.instance;
  Rx<User> _firebaseUser = Rx<User>();
  var userIsAuthenticated = false.obs;
  String retorno = "";

  @override
  void onInit() {
    super.onInit();
    _firebaseUser.bindStream(_autent.authStateChanges());
    ever(_firebaseUser, (User user) {
      if (user != null) {
        userIsAuthenticated.value = true;
      } else {
        userIsAuthenticated.value = false;
      }
    });
  }

  User get user => _firebaseUser.value;
  static AutentServ get to => Get.find<AutentServ>();

  String pegarRetorno() {
    return retorno;
  }

  criarUsuario(
      /*String nome, */ String email,
      /* String usuario, */ String senha) async {
    try {
      await _autent.createUserWithEmailAndPassword(
          email: email, password: senha);
      retorno = "ok";
    } catch (e) {
      retorno = e.toString();
    }
  }

  login(String email, String senha) async {
    try {
      await _autent.signInWithEmailAndPassword(email: email, password: senha);
      retorno = "ok";
    } catch (e) {
      retorno = e.toString();
    }
  }

  logout() async {
    try {
      await _autent.signOut();
      retorno = "ok";
    } catch (e) {
      retorno = e.toString();
    }
  }
}
