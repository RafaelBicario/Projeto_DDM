import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/domain/entities/contact.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'contact_list_back.dart';

// class Contatos extends StatefulWidget {
//   const Contatos({Key? key}) : super(key: key);
//   Future<List<Map<String, dynamic>>> _buscar() async {
//     Database? db = await Connection.get();
//     return db!.query('dados');
//   }
// }

class ContactList extends StatefulWidget {
  const ContactList({Key? key}) : super(key: key);

  @override
  _ContactListState createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final _back = ContactListBack();

  Widget iconEditButton(BuildContext context, Contact contact) {
    return IconButton(
        icon: Icon(Icons.edit),
        color: Colors.black,
        onPressed: () => _back.goToForm(context, contact));
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
                    content: Text('Deseja deletar este atendimento ?'),
                    actions: [
                      TextButton(
                        child: Text('Não'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Sim'),
                        onPressed: () => remove(),
                      ),
                    ],
                  ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text('Lista de Atendimentos'),
          actions: [
            IconButton(
                icon: Icon(Icons.add), onPressed: () => _back.goToForm(context)
                // onPressed: () {
                //   Navigator.of(context).pushNamed('contact-form').then(() => _back.refreshList() );
                // }
                )
          ],
        ),
        body: Observer(builder: (context) {
          return FutureBuilder(
              future: _back.list,
              builder: (context, futuro) {
                if (!futuro.hasData) {
                  return CircularProgressIndicator();
                } else {
                  var lista = futuro.data as List<Contact>;
                  return ListView.builder(
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      var contato = lista[i];
                      return ListTile(
                        title: Text(contato.raca!),
                        onTap: () {
                          _back.goToDetails(context, contato);
                        },
                        subtitle: Text(contato.telefone!),
                        trailing: Container(
                          width: 100,
                          child: Row(
                            children: [
                              iconEditButton(context, contato),
                              iconRemoveButton(context, () {
                                _back.remove(contato.id!);
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
}
