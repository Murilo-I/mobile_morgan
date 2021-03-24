import 'package:flutter/material.dart';

// Classe genérica pra criar as mensagens de usuário e da morgan
abstract class Message extends StatelessWidget {
  final MainAxisAlignment _alignment;
  final Color _backgroundColor;
  final Color color;
  final String msg;

  Message(this.msg, this._alignment, this._backgroundColor, this.color);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: _alignment,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              msg,
              style: TextStyle(
                fontSize: 20,
                backgroundColor: _backgroundColor,
                color: color,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class UserMessage extends Message {
  UserMessage(String msg)
      : super(msg, MainAxisAlignment.end, Colors.white, Colors.black);
}

class MorganMessage extends Message {
  MorganMessage(String msg)
      : super(msg, MainAxisAlignment.start, Colors.blueGrey.shade700,
            Colors.white);
}
