import 'package:flutter_application_1/app/domain/entities/contact.dart';
import 'package:flutter_application_1/app/domain/interfaces/contact_dao.dart';
import 'package:sqflite/sqflite.dart';

import '../connection.dart';

class ContactDAOimpl implements ContactDao {
  Database? _db;

  @override
  Future<List<Contact>> find() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> resultado = await _db!.query('contact');
    List<Contact> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Contact(
          telefone: linha['telefone'],
          descricao: linha['descricao'],
          valor: linha['valor'] + 0.0,
          id: linha['id'],
          raca: linha['raca'],
          data_cadastro: linha['data_cadastro']);
    });
    return lista;
  }

  @override
  remove(dynamic id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM contact WHERE id = ?';
    _db!.rawDelete(sql, [id]);
  }

  @override
  save(Contact contact) async {
    _db = await Connection.get();
    var sql;
    if (contact.id == null) {
      sql =
          'INSERT INTO contact (raca, telefone, descricao, valor) VALUES(?,?,?,?)';
      _db!.rawInsert(sql,
          [contact.raca, contact.telefone, contact.descricao, contact.valor]);
    } else {
      sql =
          'UPDATE contact SET raca =?, telefone = ?, descricao = ?, valor = ?,  = ? WHERE id = ? ';
      _db!.rawUpdate(sql,
          [contact.raca, contact.telefone, contact.descricao, contact.valor]);
    }
  }
}
