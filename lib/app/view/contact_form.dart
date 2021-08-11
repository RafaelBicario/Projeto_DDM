import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'contact_form_back.dart';

class ContactForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldRaca(ContactFormBack back) {
    return TextFormField(
        validator: back.validateRaca,
        onSaved: (newValue) => back.contact?.raca = newValue,
        initialValue: back.contact?.raca ?? '',
        decoration: InputDecoration(
            labelText: 'Raça: ', hintText: 'Informe a Raça do Animal'));
  }

  Widget fieldDescricao(ContactFormBack back) {
    return TextFormField(
        initialValue: back.contact?.descricao ?? '',
        onSaved: (newValue) => back.contact?.descricao = newValue,
        decoration: InputDecoration(
            labelText: 'Descrição:', hintText: 'Descrição do Problema'));
  }

  Widget fieldPhone(ContactFormBack back) {
    var mask = MaskTextInputFormatter(mask: '(##) # ####-####');
    return TextFormField(
        validator: back.validatePhone,
        onSaved: (newValue) => back.contact!.telefone = newValue,
        initialValue: back.contact?.telefone ?? '',
        inputFormatters: [mask],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'Telefone:', hintText: '(99) 9 9999-9999'));
  }

  Widget fieldValor(ContactFormBack back) {
    return TextFormField(
        onSaved: (newValue) => back.contact?.valor = newValue as double,
        initialValue:
            back.contact?.valor == null ? '' : back.contact?.valor.toString(),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'Valor:', hintText: 'Valor do Atendimento: '));
  }

  @override
  Widget build(BuildContext context) {
    var _back = ContactFormBack(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Atendimentos'),
        actions: [
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _form.currentState!.validate();
                _form.currentState!.save();
                if (_back.isValid) {
                  _back.save();
                  Navigator.of(context).pop();
                }
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Form(
          key: _form,
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
