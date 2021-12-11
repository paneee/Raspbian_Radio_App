import 'package:flutter/material.dart'; 
import 'package:raspbian_radio_app/utils/Syle.dart';

// ignore: must_be_immutable
class GradientButtonAlternative extends StatelessWidget {
  var child;
  var onPressed;

  GradientButtonAlternative({this.onPressed, this.child});

  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 50,
        decoration: ShapeDecoration(
          shape: StadiumBorder(),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [lightColor, darkColor],
          ),
        ),
        child: MaterialButton(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: StadiumBorder(),
          child: Text(
            'A Samll Button',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            print('Hello!');
          },
        ),
      ),
    );
  }
}
