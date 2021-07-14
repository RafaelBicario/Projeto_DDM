import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'contact_form_back.dart';

class ContactForm extends StatelessWidget {
  Widget fieldRaca(ContactFormBack back) {
    return TextFormField(
        initialValue: back.contact.nome,
        decoration: InputDecoration(
            labelText: 'Raça: ', hintText: 'Informe a Raça do Animal'));
  }

  Widget fieldDescricao(ContactFormBack back) {
    return TextFormField(
        initialValue: back.contact.descricao,
        decoration: InputDecoration(
            labelText: 'Descrição:', hintText: 'Descrição do Problema'));
  }

  Widget fieldPhone(ContactFormBack back) {
    var mask = MaskTextInputFormatter(mask: '(##) # ####-####');
    return TextFormField(
        initialValue: back.contact.phone,
        inputFormatters: [mask],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'Telefone:', hintText: '(99) 9 9999-9999'));
  }

  Widget fieldValor(ContactFormBack back) {
    return TextFormField(
        initialValue: back.contact.valor,
        decoration: InputDecoration(
            labelText: 'Valor:', hintText: 'Valor do Atendimento: '));
  }

  @override
  Widget build(BuildContext context) {
    var _back = ContactFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Atendimentos'),
        actions: [IconButton(icon: Icon(Icons.save), onPressed: null)],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          child: Column(children: [
            fieldRaca(_back),
            fieldDescricao(_back),
            fieldPhone(_back),
            fieldValor(_back),
          ]),
        ),
      ),
    );
  }
}
