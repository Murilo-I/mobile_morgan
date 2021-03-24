import 'package:flutter/material.dart';

import 'package:mobile_morgan/telas/tela-login.dart';

void main() {
  runApp(MorganApp());
}

class MorganApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Morgan App',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Login(),
    );
  }
}
