import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('===Pet Shop Name==='),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              iconSize: 45,
              onPressed: () {
                Navigator.of(context).pushNamed('contact-form');
              })
        ],
      ),
    );
  }
}
