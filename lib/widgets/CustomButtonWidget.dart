import 'package:flutter/material.dart';
import '/utils/color.dart';

// ignore: must_be_immutable
class CustomButtonWidget extends StatelessWidget {
  var btnText = "";
  var onClick;

  CustomButtonWidget({required this.btnText, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [darkColor, lightColor],
              end: Alignment.centerLeft,
              begin: Alignment.centerRight),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          btnText,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
