import 'package:flutter_application_1/app/domain/services/contact_service.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

part 'contact_form_back.g.dart';

class ContactFormBack = _ContactFormBack with _$ContactFormBack;

abstract class _ContactFormBack with Store {
  Contact contact;
  var _service = GetIt.I.get<ContactService>();
  bool _racaIsValid;
  // bool _descricaoIsValid;
  bool _phoneIsValid;
  // bool _valorIsValid;

  bool get isValid => _racaIsValid && _descricaoIsValid && _phoneIsValid;

  _ContactFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context).settings.arguments;
    contact = (parameter == null) ? Contact() : parameter;
  }

  save() async {
    await _service.save(contact);
  }

  String validateRaca(String raca) {
    try {
      _service.validadeRaca(raca);
      _racaIsValid = true;
      return null;
    } catch (e) {
      _racaIsValid = false;
      return e.toString();
    }
  }

  String validatePhone(String phone) {
    try {
      _service.validadePhone(phone);
      _phoneIsValid = true;
      return null;
    } catch (e) {
      _phoneIsValid = false;
      return e.toString();
    }
  }
}
