import 'package:flutter_application_1/app/domain/entities/contact.dart';
import 'package:flutter_application_1/app/domain/interfaces/contact_dao.dart';
import 'package:sqflite/sqflite.dart';

import '../connection.dart';

class ContactDAOimpl implements ContactDao {
  Database _db;

  @override
  Future<List<Contact>> find() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> resultado = await _db.query('contact');
    List<Contact> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Contact(
          telefone: linha['telefone'],
          descricao: linha['descricao'],
          valor: linha['valor'],
          id_dados: linha['id']);
    });
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM dados WHERE id_dados = ?';
    _db.rawDelete(sql, [id]);
  }

  @override
  save(Contact contact) async {
    _db = await Connection.get();
    var sql;
    if (contact.id_dados == null) {
      sql = 'INSERT INTO dados (telefone, descricao, valor) VALUES(?,?,?)';
      _db.rawInsert(sql, [contact.telefone, contact.descricao, contact.valor]);
    } else {
      sql =
          'UPDATE dados SET telefone = ?, telefone = ?, descricao = ?,  = ? WHERE id_dados = ? ';
      _db.rawUpdate(sql, [id]);
    }
  }
}
