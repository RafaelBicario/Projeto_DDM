import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/app/domain/entities/contact.dart';
import 'package:flutter_application_1/app/domain/services/contact_service.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../my_app.dart';

part 'contact_list_back.g.dart';

class ContactListBack = _ContactListBack with _$ContactListBack;

abstract class _ContactListBack with Store {
  var _service = GetIt.I.get<ContactService>();

  @observable
  late Future<List<Contact?>> list;

  @action
  refreshList((dynamic value)) {
    list = _service.find();
  }

  _ContactListBack() {
    refreshList();
  }

  goToForm(BuildContext context, [Contact contact]) {
    Navigator.of(context).pushNamed(MyApp.Contact,arguments: contact).then(refreshList);
  }

  remove(int id){
    _service.remove(id);
    refreshList();
  }
}
