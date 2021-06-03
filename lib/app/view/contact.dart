import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
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
