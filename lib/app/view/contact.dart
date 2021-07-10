import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/database/sqlite/connection.dart';
import 'package:flutter_application_1/app/domain/entities/contact.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sqflite/sqflite.dart';

import '../my_app.dart';
import 'contact_list_back.dart';

// class Contatos extends StatefulWidget {
//   const Contatos({Key? key}) : super(key: key);
//   Future<List<Map<String, dynamic>>> _buscar() async {
//     Database? db = await Connection.get();
//     return db!.query('dados');
//   }

final _back = ContactListBack();

Widget iconEditButton(Function onPressed) {
  return IconButton(
      icon: Icon(Icons.edit), color: Colors.blueGrey, onPressed: onPressed());
}

Widget iconRemoveButton(BuildContext context, Function remove) {
  return IconButton(
      icon: Icon(Icons.delete),
      color: Colors.red,
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text('Deletar Registro'),
                  content: Text('Deseja Deletar este registro?'),
                  actions: [
                    FlatButton(
                      child: Text('Não'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    FlatButton(
                      child: Text('Sim'),
                      onPressed: remove(),
                    ),
                  ],
                ));
      });
}

@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contatos'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(MyApp.contact_form);
              })
        ],
      ),
      body: Observer(builder: (context) {
        return FutureBuilder(
            future: _back.list,
            builder: (context, futuro) {
              if (!futuro.hasData) {
                return CircularProgressIndicator();
              } else {
                List<Contact> lista = futuro.data;
                return ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, i) {
                    var contato = lista[i];
                    return ListTile(
                      title: Text(contato.raca),
                      subtitle: Text(contato.telefone),
                      trailing: Container(
                        width: 100,
                        child: Row(
                          children: [
                            iconEditButton(() {
                              _back.goToForm(context, contato);
                            }),
                            iconRemoveButton(context, () {
                              _back.remove(contato.id);
                              Navigator.of(context).pop();
                            })
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            });
      }));
}
