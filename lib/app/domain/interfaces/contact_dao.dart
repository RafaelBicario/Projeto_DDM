import 'package:flutter_application_1/app/domain/entities/contact.dart';

abstract class ContactDao {
  save(Contact contact);

  remove(dynamic id);

  Future<List<Contact>> find();
}
