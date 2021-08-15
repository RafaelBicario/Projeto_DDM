import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'app_form_back.dart';

class ContactForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

  Widget fieldRaca(ContactFormBack back) {
    return TextFormField(
        validator: back.validateRaca,
        onSaved: (newValue) => back.contact?.raca = newValue,
        initialValue: back.contact?.raca ?? '',
        decoration:
            InputDecoration(labelText: 'Raça: ', hintText: 'Raça do Animal'));
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
        onSaved: (newValue) => back.contact?.valor = double.parse(newValue!),
        initialValue:
            back.contact?.valor == null ? '' : back.contact?.valor.toString(),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'Valor:', hintText: 'Valor do Atendimento: '));
  }

  Widget fieldData(ContactFormBack back) {
    var mask = MaskTextInputFormatter(mask: '##/##/##');
    return TextFormField(
        onSaved: (newValue) => back.contact?.data_cadastro = newValue,
        initialValue: back.contact?.data_cadastro == null
            ? ''
            : back.contact?.data_cadastro.toString(),
        inputFormatters: [mask],
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: 'Data do Atendimento:',
            hintText: 'Data do Atendimento '));
  }

  @override
  Widget build(BuildContext context) {
    var _back = ContactFormBack(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text('Cadastro de Atendimentos'),
        actions: [],
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
            fieldData(_back),
            IconButton(
              icon: Icon(Icons.add),
              iconSize: 35,
              onPressed: () {
                _form.currentState!.validate();
                _form.currentState!.save();
                if (_back.isValid) {
                  _back.save();
                  Navigator.of(context).pop();
                }
              },
            )
          ]),
        ),
      ),
    );
  }
}
