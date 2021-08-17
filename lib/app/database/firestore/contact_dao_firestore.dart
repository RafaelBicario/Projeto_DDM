import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/app/domain/entities/contact.dart';
import 'package:flutter_application_1/app/domain/interfaces/app_dao.dart';

class ContactDAOFirestore implements ContactDao {
  late CollectionReference contactCollection;

  ContactDAOFirestore() {
    contactCollection = FirebaseFirestore.instance.collection('contact');
  }

  @override
  Future<List<Contact>> find() async {
    var result = await contactCollection.get();
    return result.docs
        .map((doc) => Contact(
            id: doc.reference.id.toString(),
            raca: doc['raca'],
            telefone: doc['telefone'],
            descricao: doc['descricao'],
            valor: doc['valor'],
            data_cadastro: doc['data_cadastro']))
        .toList();
  }

  @override
  remove(id) {
    contactCollection.doc(id).delete();
  }

  @override
  save(Contact contact) {
    contactCollection.doc(contact.id).set({
      'raca': contact.raca,
      'telefone': contact.telefone,
      'descricao': contact.descricao,
      'valor': contact.valor,
      'data_cadastro': contact.data_cadastro
    });
  }
}
