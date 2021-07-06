import 'package:flutter/material.dart';
import 'Api.dart';
import 'WebRadios.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late Future<List<WebRadio>> futureRadioList;
  late List<WebRadio> radioTest = [
    (new WebRadio(name: "pierwsze", url: "www.onet.pl")),
    (new WebRadio(name: "drugie", url: "www.onet.pl")),
    (new WebRadio(name: "trzecie", url: "www.onet.pl")),
    (new WebRadio(name: "czwarte", url: "www.onet.pl")),
    (new WebRadio(name: "piate", url: "www.onet.pl")),
  ];
  late List<String> radioName;

  int _value = 0;
  int i = 0;
  String _myState = "";
  String dropdownValue = "One";

  @override
  void initState() {
    super.initState();
    futureRadioList = getRadios();

    for (var item in radioTest) {
      radioName.add(item.name);
    }
  }

  void _incrementCounter() {
    setState(() {
      futureRadioList = getRadios();
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: radioName.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ButtonTheme(
              minWidth: 200.0,
              height: 100.0,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Play"),
              ),
            ),
            ButtonTheme(
              minWidth: 200.0,
              height: 100.0,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Stop"),
              ),
            ),
            FutureBuilder<List<WebRadio>>(
              future: futureRadioList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.first.url);
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
            Text('Moj tekst'),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
