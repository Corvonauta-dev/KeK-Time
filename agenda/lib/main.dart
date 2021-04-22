import 'package:agenda/pages/Calendario_eventos/+c/janelinha.dart';
import 'package:agenda/pages/Horarios/pghorario.dart';
import 'package:agenda/pages/Login/pglogin.dart';
import 'package:agenda/pages/Tela_inicial/pgtelaini.dart';
import 'package:agenda/repositories/eventsRepositorie.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));

  runApp(ChangeNotifierProvider(
    create: (context) => EventsRepositorie(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: JanelaLogin(),
    );
  }
}
