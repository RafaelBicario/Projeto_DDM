import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/domain/entities/contact.dart';

import 'app_details_back.dart';

class ContactDetails extends StatelessWidget {
  showModalError(BuildContext context) {
    var alert = AlertDialog(
      title: Text('Alerta'),
      content: Text('Não foi possível encontrar um APP compatível.'),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  @override
  Widget build(BuildContext context) {
    var _back = ContactDetailsBack(context);
    Contact? contact = _back.contact;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.biggest.width;
        // var height = constraints.biggest.height;

        return Scaffold(
          body: ListView(
            children: [
              Center(
                child: Text('${contact!.raca}', style: TextStyle(fontSize: 30)),
              ),
              Card(
                child: ListTile(
                  title: Text('Telefone'),
                  subtitle: Text('${contact.telefone}'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('Descrição do Problema'),
                  subtitle: Text('${contact.descricao}'),
                ),
              ),
              Card(
                child: ListTile(
                    title: Text('Valor'),
                    subtitle: Text('${contact.valor ?? 0}'),
                    trailing:
                        Container(width: width / 4, child: Row(children: []))),
              ),
              Card(
                child: ListTile(
                    title: Text('Data'),
                    subtitle: Text('${contact.data_cadastro}'),
                    trailing:
                        Container(width: width / 4, child: Row(children: []))),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              _back.goToBack();
            },
          ),
        );
      },
    );
  }
}
