import 'package:flutter/material.dart';

Color orangeColors = Color(0xffF5591F);
Color orangeLightColors = Color(0xffF2861E);

Color redColors = Color(0xffcc0000);
Color redLightColors = Color(0xffff4d4d);

Color blueColors = Color(0xff1976D2);
Color blueLightColors = Color(0xff42A5F5);

Color greenColors = Color(0xff00802b);
Color greenLightColors = Color(0xff00cc44);

Color darkColor = Color(0xff1976D2);
Color lightColor = Color(0xff42A5F5);

void selectColor(String color) {
  switch (color) {
    case 'Red':
      darkColor = redColors;
      lightColor = redLightColors;
      break;
    case 'Blue':
      darkColor = blueColors;
      lightColor = blueLightColors;
      break;
    case 'Green':
      darkColor = greenColors;
      lightColor = greenLightColors;
      break;
    case 'Orange':
      darkColor = orangeColors;
      lightColor = orangeLightColors;
      break;
  }
}

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
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 22,
            offset: Offset(0, 0), // changes position of shadow
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
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black));
  }
}
