import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:raspbian_radio_app/utils/Syle.dart';

// ignore: must_be_immutable
class HeaderContainer extends StatelessWidget {
  var text = "";
  var item;

  HeaderContainer({
    required this.text,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [darkColor, lightColor],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Stack(
        children: <Widget>[
          Positioned(
            child: item,
            top: 20,
            left: 20,
          ),
          Positioned(
              bottom: 20,
              right: 20,
              child: Text(
                text,
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          Center(
            child: FaIcon(
              FontAwesomeIcons.podcast,
              color: Colors.white,
              size: 200,
            ),
          ),
        ],
      ),
    );
  }
}
