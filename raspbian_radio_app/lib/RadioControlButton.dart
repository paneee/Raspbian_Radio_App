import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RadioControlButton extends StatelessWidget {
  RadioControlButton({this.text});
  String? text;
  Widget build(BuildContext context) {
    return ButtonTheme(
        minWidth: 400.0,
        height: 100.0,
        child: ElevatedButton(
          onPressed: () {},
          child: Text(text!),
        ));
  }
}
