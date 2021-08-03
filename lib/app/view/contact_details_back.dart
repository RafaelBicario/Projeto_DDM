import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/domain/entities/contact.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactDetailsBack {
  BuildContext context;
  Contact contact;

  ContactDetailsBack(this.context) {
    contact = ModalRoute.of(context).settings.arguments;
  }

  goToBack() {
    Navigator.of(context).pop();
  }

  _launchApp(String url, Function(BuildContext context) showModalError) async {
    await canLaunch(url) ? await launch(url) : showModalError(context);
  }

  launchPhone(Function(BuildContext context) showModalError) {
    _launchApp('tel:${contact.telefone}', showModalError);
  }
}
