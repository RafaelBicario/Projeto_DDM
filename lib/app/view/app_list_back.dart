import 'package:flutter_application_1/app/domain/entities/contact.dart';
import 'package:flutter_application_1/app/domain/services/app_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../my_app.dart';

part 'app_list_back.g.dart';

// comando:
// flutter packages pub run build_runner watch

class ContactListBack = _ContactListBack with _$ContactListBack;

abstract class _ContactListBack with Store {
  var _service = GetIt.I.get<ContactService>();

  @observable
  Future<List<Contact?>>? list;

  @action
  refreshList([dynamic value]) {
    list = _service.find();
  }

  _ContactListBack() {
    refreshList();
  }

  goToForm(BuildContext context, [Contact? contact]) {
    Navigator.of(context)
        .pushNamed(MyApp.CONTACT_FORM, arguments: contact)
        .then(refreshList);
  }

  goToDetails(BuildContext context, Contact contact) {
    Navigator.of(context).pushNamed(MyApp.CONTACT_DETAILS, arguments: contact);
  }

  remove(dynamic id) {
    _service.remove(id);
    refreshList();
  }
}
