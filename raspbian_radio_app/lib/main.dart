import 'package:flutter/material.dart';
import 'package:raspbian_radio_app/Syle.dart';
import 'RadioStationDropDownList.dart';
import 'RadioControlButton.dart';
import 'WebRadios.dart';
import 'Api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Raspbian Web Radio',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Raspbian Web Radio'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<WebRadio>> futRadioList;
  WebRadio? radioSelectedItem;

  @override
  void initState() {
    super.initState();
    futRadioList = getRadios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          StyledContainer(
              child: RadioStationDropDownListWidget(
                  futureRadioList: futRadioList,
                  webRadioSelectedItem: radioSelectedItem),
              color: Colors.red,
              width: 0.85,
              height: 0.1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            side: BorderSide(color: Colors.red)))),
                onPressed: () {},
                child: StyledText("Play"),
              ),
              StyledContainer(
                width: 0.4,
                height: 0.1,
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    onPressed: () {},
                    padding: EdgeInsets.only(
                        left: 10, top: 10, right: 10, bottom: 10),
                    color: Colors.red,
                    textColor: Colors.black,
                    child: StyledText("Stop")),
              ),
            ],
          ),
          Text("column 2"),
          StyledContainer(
              width: 0.85,
              height: 0.1,
              color: Colors.white,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[StyledText("Tydzień 23")])),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text("row 11"), Text("row 12")],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text("row 21"), Text("row 22")],
          ),
        ],
      )),
    );
  }
}



//Button Play

//Button Volume
