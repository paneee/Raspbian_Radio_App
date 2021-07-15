import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:raspbian_radio_app/utils/Syle.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  var btnText = "";
  var onClick;

  CustomButton({required this.btnText, this.onClick});

  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onClick,
        style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25))),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [lightColor, darkColor]),
              borderRadius: BorderRadius.circular(25)),
          child: Container(
            width: 200,
            height: 60,
            alignment: Alignment.center,
            child: Text(
              btnText,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
