library okbatterie_libary;

import 'package:flutter/material.dart';

/// A Calculator.
class myTestLabel extends StatelessWidget {
  Widget _textSection() => Flexible(
        child: Container(
            padding: const EdgeInsets.all(32),
            color: Colors.blue[200],
            child: Column(
              children: <Widget>[
                Text(
                  'Text',
                )
              ],
            )),
      );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _textSection();
  }
}
