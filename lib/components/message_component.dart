import 'dart:async';

import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

// ignore: must_be_immutable
abstract class Message extends StatefulWidget {
  final MainAxisAlignment _alignment;
  final Color _backgroundColor;
  final Color _textColor;
  final String _msg;
  bool _loader;

  Message(this._msg, this._alignment, this._backgroundColor, this._textColor,
      this._loader);

  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  _text(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        color: widget._textColor,
      ),
    );
  }

  _loader() {
    if (widget._alignment == MainAxisAlignment.end) return;
    Timer _debounce;
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(Duration(milliseconds: 1500),
        () => setState(() => widget._loader = !widget._loader));
  }

  @override
  void initState() {
    _loader();
    super.initState();
  }

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
              child: widget._loader
                  ? Row(
                      children: [
                        _text('Digitando'),
                        JumpingDotsProgressIndicator(
                          numberOfDots: 3,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ],
                    )
                  : _text(widget._msg),
            ),
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class UserMessage extends Message {
  UserMessage(String msg)
      : super(msg, MainAxisAlignment.end, Colors.white, Colors.black, false);
}

// ignore: must_be_immutable
class MorganMessage extends Message {
  MorganMessage(String msg)
      : super(msg, MainAxisAlignment.start, Colors.blueGrey.shade800,
            Colors.white, true);
}
