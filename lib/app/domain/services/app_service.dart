import 'package:flutter_application_1/app/domain/entities/contact.dart';
import 'package:flutter_application_1/app/domain/exception/domain_layer_exception.dart';
import 'package:flutter_application_1/app/domain/interfaces/app_dao.dart';
import 'package:get_it/get_it.dart';

class ContactService {
  var _dao = GetIt.I.get<ContactDao>();

  save(Contact contact) {
    validadeRaca(contact.raca!);
    _dao.save(contact);
  }

  remove(dynamic id) {
    _dao.remove(id);
  }

  Future<List<Contact>> find() {
    return _dao.find();
  }

  validadeRaca(String? raca) {
    var min = 3;
    var max = 50;

    if (raca == null) {
      throw new DomainLayerException('A Raça é Obrigatória');
    } else if (raca.length < min) {
      throw new DomainLayerException(
          'A Raça deve possuir pelo menos $min caracteres');
    } else if (raca.length > max) {
      throw new DomainLayerException('Limite de Caractéres atingido');
    }
  }
}
