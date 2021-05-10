import 'package:flutter/material.dart';
import 'package:mobile_morgan/db/historico_conversa.dart';
import 'package:mobile_morgan/telas/tela-login.dart';

openMenu(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('Ações'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () => apagarHistorico(),
              child: const Text('Apagar histórico'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                    (route) => false);
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      });
}
