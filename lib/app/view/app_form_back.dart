import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/domain/entities/contact.dart';
import 'package:flutter_application_1/app/domain/services/app_service.dart';
import 'package:get_it/get_it.dart';
// import 'package:mobx/mobx.dart';

class ContactFormBack {
  Contact? contact;
  var _service = GetIt.I.get<ContactService>();
  bool? _racaIsValid;
  bool? _phoneIsValid;

  bool get isValid => (_racaIsValid ?? false) && (_phoneIsValid ?? false);

  ContactFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context)!.settings.arguments;
    contact = (parameter == null) ? Contact() : parameter as Contact;
  }

  save() async {
    await _service.save(contact!);
  }

  String? validateRaca(String? raca) {
    try {
      _service.validadeRaca(raca!);
      _racaIsValid = true;
      return null;
    } catch (e) {
      _racaIsValid = false;
      return e.toString();
    }
  }

  String? validatePhone(String? telefone) {
    try {
      _phoneIsValid = true;
      return null;
    } catch (e) {
      _phoneIsValid = false;
      return e.toString();
    }
  }
}
