import 'dart:convert';

import 'package:http/http.dart'as http;

import 'package:flutter_application_1/app/domain/entities/contact.dart';
import 'package:flutter_application_1/app/domain/interfaces/app_dao.dart';

class ContactDAOMySQL implements ContactDao {
  final uriREST = Uri.parse('http://192.168.1.5:8080/contato');

  @override
  Future<List<Contact>> find() async{
    var resposta = await http.get((uriREST));
  if(resposta.statusCode == 200){
    Iterable listDart = json.decode(resposta.body);
    
    var listContact = <Contact>[];
    for (Map<String,dynamic> item in listDart){

      var contact = Contact(
        id:item['id'],
        raca:item['raca'],
        telefone:item['telefone'],
        descricao:item['descricao'],
        valor:item['valor'],
        data_cadastro:item['data_cadastro']
      );
      listContact.add(contact);
    
    }return listContact;


  }else{
    throw Exception('Erro REST API');
  }
  }

  @override
  remove(id) async{
    var uri = Uri.parse('http://192.168.1.5:8080/contato/$id');
    var resposta = await http.delete(uri);
    if(resposta.statusCode!=200) throw Exception('Erro Rest API');
  }

  @override
  save(Contact contact) async{
  var headers = {
    'Content-Type':'application/json'
  };

  var contactJson = jsonEncode(
    {
      'id':contact.id,
      'raca':contact.raca,
      'telefone': contact.telefone,
      'descricao':contact.descricao,
      'valor':contact.valor,
      'data_cadastro':contact.data_cadastro
    }
  );

  int statusCode = 0;

  if (contact.id == null){
   var resposta = await http.post(uriREST,headers: headers ,body: contactJson);
   statusCode = resposta.statusCode;
  }else{
    var resposta = await http.put(uriREST,headers: headers ,body: contactJson);
   statusCode = resposta.statusCode;
  }
  if(statusCode!= 200) throw Exception('Erro REST API.');

  }
  
}