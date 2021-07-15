import 'package:flutter/material.dart';
import 'package:raspbian_radio_app/pages/Splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Design',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashPage(),
    );
  }
}


// ToDo: 
// Change theme (color), ponowne zaladowanie strony po przycisku return
// Integration with SQL for save settings
// Marginesy paddingi dla nowego button-a
