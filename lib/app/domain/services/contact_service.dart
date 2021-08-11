import 'package:flutter_application_1/app/domain/entities/contact.dart';
import 'package:flutter_application_1/app/domain/exception/domain_layer_exception.dart';
import 'package:flutter_application_1/app/domain/interfaces/contact_dao.dart';
import 'package:get_it/get_it.dart';

class ContactService {
  var _dao = GetIt.I.get<ContactDao>();

  save(Contact contact) {
    validadeRaca(contact.raca!);
    // validadePhone(contact.telefone!);
    _dao.save(contact);
  }

  remove(int id) {
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

  // validadePhone(String? telefone) {
  //   var format = RegExp(r'^([1-9]{2}) [9] [6-9]{1}[0-9]{3}-[0-9]{4}$');
  //   if (telefone == null) {
  //     throw DomainLayerException('O Telefone é Obrigatório');
  //   } else if (!format.hasMatch(telefone)) {
  //     throw new DomainLayerException('Formato Invalido');
  //   }
  // }
}
