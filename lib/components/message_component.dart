import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

abstract class Message extends StatefulWidget {
  final MainAxisAlignment _alignment;
  final Color _backgroundColor;
  final Color _textColor;
  final String _msg;
  final bool loader;

  Message(this._msg, this._alignment, this._backgroundColor, this._textColor,
      {this.loader});

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: widget._alignment,
      children: [
        Flexible(
          child: Card(
            color: widget._backgroundColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget._msg,
                style: TextStyle(
                  fontSize: 20,
                  color: widget._textColor,
                ),
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
      : super(msg, MainAxisAlignment.start, Colors.blueGrey.shade800,
            Colors.white,
            loader: true);
}
