import 'dart:ui';

import 'package:flutter/material.dart';

class StyledContainer extends StatelessWidget {
  final Widget? child;
  final Color? color;
  final double? width;
  final double? height;

  StyledContainer({this.child, this.color, this.width, this.height});
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * this.width!,
      height: MediaQuery.of(context).size.height * this.height!,
      margin: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 0),
      padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 10),
      child: child,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}

class StyledText extends StatelessWidget {
  final String text;
  StyledText(this.text);
  Widget build(BuildContext context) {
    return Text(this.text,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18));
  }
}
