import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/view/app_details.dart';
import 'package:flutter_application_1/app/view/app_form.dart';
import 'package:flutter_application_1/app/view/app_list.dart';

class MyApp extends StatelessWidget {
  static const HOME = "/";
  static const CONTACT_FORM = 'contact-form';
  static const CONTACT_DETAILS = 'contact-details';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.cyan,
      ),
      routes: {
        HOME: (context) => ContactList(),
        CONTACT_FORM: (context) => ContactForm(),
        CONTACT_DETAILS: (context) => ContactDetails()
      },
    );
  }
}
