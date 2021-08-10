import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/domain/entities/contact.dart';
import 'package:url_launcher/url_launcher.dart';

import 'contact_details_back.dart';

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
        var height = constraints.biggest.height;

        return Scaffold(
          body: ListView(
            // padding:EdgeInserts.all(60),
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
                    title: Text('Valor'),
                    subtitle: Text('${contact.valor ?? 0}'),
                    trailing: Container(
                        width: width / 4,
                        child: Row(children: [
                          IconButton(
                              color: Colors.blue,
                              icon: Icon(Icons.message),
                              onPressed: () {
                                _back.launchPhone(showModalError(context));
                              }),
                          IconButton(
                              color: Colors.blue,
                              icon: Icon(Icons.phone),
                              onPressed: () {})
                        ]))),
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
