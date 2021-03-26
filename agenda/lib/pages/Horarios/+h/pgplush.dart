import 'package:flutter/material.dart';

class Janelona extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Add Materia",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          Image(
            image: AssetImage("assets/calendario.jpg"),
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.green[700]),
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.green[700],
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide(
                          color: Colors.greenAccent[400],
                        ),
                      ),
                      labelText: 'Nome Completo',
                      labelStyle:
                          TextStyle(color: Colors.green[700], fontSize: 12),
                      filled: true,
                      fillColor: Colors.green[50],
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Por Favor Digite o Nome Completo";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.green[700]),
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.green[700],
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide(
                          color: Colors.greenAccent[400],
                        ),
                      ),
                      labelText: 'Nome Completo',
                      labelStyle:
                          TextStyle(color: Colors.green[700], fontSize: 12),
                      filled: true,
                      fillColor: Colors.green[50],
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Por Favor Digite o Nome Completo";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.green[700]),
                    keyboardType: TextInputType.name,
                    textCapitalization: TextCapitalization.words,
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.green[700],
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        borderSide: BorderSide(
                          color: Colors.greenAccent[400],
                        ),
                      ),
                      labelText: 'Nome Completo',
                      labelStyle:
                          TextStyle(color: Colors.green[700], fontSize: 12),
                      filled: true,
                      fillColor: Colors.green[50],
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Por Favor Digite o Nome Completo";
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.white30,
      ),
    );
  }
}
