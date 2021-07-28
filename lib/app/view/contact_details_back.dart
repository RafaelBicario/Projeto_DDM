import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/domain/entities/contact.dart';

class ContactDetailsBack {
  BuildContext context;
  Contact contact;

  ContactDetailsBack(this.context) {
    contact = ModalRoute.of(context).settings.arguments;
  }

  goToBack() {
    Navigator.of(context).pop();
  }
}
