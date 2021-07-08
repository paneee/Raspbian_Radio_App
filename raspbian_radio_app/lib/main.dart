import 'package:flutter/material.dart';
import 'package:raspbian_radio_app/Syle.dart';
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
  Future<List<WebRadio>>? futureRadioList;
  WebRadio? webRadioSelectedItem;

  double _currentVolume = 0;

  @override
  void initState() {
    super.initState();
    futureRadioList = getRadios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(260.0),
          child: AppBar(
            title: Text(widget.title),
          )),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          StyledContainer(
              child: FutureBuilder<List<WebRadio>>(
                future: futureRadioList,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return DropdownButton<WebRadio>(
                      value: webRadioSelectedItem,
                      hint: StyledText("Wybierz stację"),
                      items: snapshot.data!.map((WebRadio value) {
                        return DropdownMenuItem<WebRadio>(
                          value: value,
                          child: new StyledText(value.name!),
                        );
                      }).toList(),
                      onChanged: (webRadio) {
                        setState(() {
                          webRadioSelectedItem = webRadio;
                        });
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),
              color: Colors.red,
              width: 0.85,
              height: 0.1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StyledContainer(
                  width: 0.4,
                  height: 0.1,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: Colors.red)))),
                      onPressed: () {},
                      child: StyledText("Play"))),
              StyledContainer(
                  width: 0.4,
                  height: 0.1,
                  child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: Colors.red)))),
                      onPressed: () {},
                      child: StyledText("Stop"))),
            ],
          ),
          StyledText("Volume"),
          StyledContainer(
              width: 1,
              height: 0.1,
              child: Slider(
                value: _currentVolume,
                min: 0,
                max: 100,
                divisions: 100,
                label: _currentVolume.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentVolume = value;
                  });
                },
              )),
        ],
      )),
    );
  }
}
