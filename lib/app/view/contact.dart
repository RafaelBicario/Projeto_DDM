import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/database/sqlite/connection.dart';
import 'package:sqflite/sqflite.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);
  Future<List<Map<String, dynamic>>> _buscar() async {
    Database db = await Connection.get();
    return db.query('dados');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _buscar(),
        builder: (context, futuro) {
          if (futuro.hasData) {
            var lista = futuro.data;
            return Scaffold();
          } else {
            Scaffold();
          }
        });
  }

  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Cadastro de pets"),
        ),
        body: Center(
            child: Column(children: [
          TextField(
            obscureText: false,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: 'Nome do Pet: '),
          ),
          TextField(
            obscureText: false,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Problema Apresentado: '),
          ),
          Center(
            child: Column(children: [
              IconButton(icon: Icon(Icons.add), iconSize: 45, onPressed: () {})
            ]),
          )
        ])));
  }
}
