import 'package:flutter_application_1/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:flutter_application_1/app/domain/entities/contact.dart';
import 'package:flutter_application_1/app/domain/exception/domain_layer_exception.dart';
import 'package:flutter_application_1/app/domain/interfaces/contact_dao.dart';
import 'package:get_it/get_it.dart';

class ContactService {
  var _dao = GetIt.I.get<ContactDao>();

  save(Contact contact) {
    validadeRaca(contact.raca);
    validadePhone(contact.telefone);
    _dao.save(contact);
  }

  remove(int id_dados) {
    _dao.remove(id_dados);
  }

  Future<List<Contact>> find() {
    return _dao.find();
  }

  validadeRaca(String raca) {
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

  validadePhone(String phone) {
    var format = RegExp(' ');
    if (phone == null) {
      throw DomainLayerException('O Telefone é Obrigatório');
    } else if (!format.hasMatch(phone)) {
      throw new DomainLayerException('Formato Invalido');
    }
  }
}
