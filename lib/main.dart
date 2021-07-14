import 'package:flutter/material.dart';
import 'package:raspbian_radio_app/pages/PageSplash.dart';

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
// Settings with ip and port (new page)
// Integration with SQL for save settings
// Change theme (color)
// Reakcja przycisku na nacisniecie
