import 'dart:async';
import 'package:flutter/material.dart';
import 'package:raspbian_radio_app/models/Settings.dart';
import 'package:raspbian_radio_app/pages/Settings.dart';
import 'package:raspbian_radio_app/utils/Preferences.dart';
import 'package:raspbian_radio_app/utils/Syle.dart';
import 'package:raspbian_radio_app/pages/Radio.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => PageRadio()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Settings>(
            future: SharedPreferencesHelper.getSettings(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                ip = snapshot.data!.ip;
                radioPort = snapshot.data!.radioPort;
                speakerPort = snapshot.data!.speakerPort;
                selectedTheme = snapshot.data!.color;

                selectColor(selectedTheme!);
              }
              return Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [darkColor, lightColor],
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter),
                ),
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.podcast,
                    color: Colors.white,
                    size: 340,
                  ),
                ),
              );
            }));
  }
}
