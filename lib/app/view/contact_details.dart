import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/domain/entities/contact.dart';

import 'contact_details_back.dart';

class ContactDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _back = ContactDetailsBack(context);
    Contact contact = _back.contact;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        var width = constraints.biggest.width;
        var height = constraints.biggest.height;

        return Scaffold(
          body: ListView(
            children: [
              Center(
                child: Text('${contact.raca}', style: TextStyle(fontSize: 30)),
              ),
              Card(
                child: ListTile(
                  title: Text('${contact.telefone}'),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('${contact.valor}'),
                ),
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
