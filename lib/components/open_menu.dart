import 'package:flutter/material.dart';
import 'package:mobile_morgan/db/historico_conversa.dart';
import 'package:mobile_morgan/telas/tela-login.dart';
import 'package:mobile_morgan/telas/tela-principal.dart';

openMenu(context) {
  showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return SimpleDialog(
          title: const Text('Ações'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                apagarHistorico();
                Navigator.of(ctx).pop();
                Navigator.of(ctx).pushReplacement(
                    MaterialPageRoute(builder: (ctx) => TelaPrincipal()));
              },
              child: const Text('Apagar histórico (Permanente!)'),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    ctx,
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
