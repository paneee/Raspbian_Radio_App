import 'package:flutter/material.dart';
import 'package:raspbian_radio_app/api/api.dart';
import 'package:raspbian_radio_app/utils/WebRadios.dart';
import 'package:raspbian_radio_app/widgets/HerderContainer.dart';

class PageSettings extends StatefulWidget {
  @override
  _PageSettingsState createState() => _PageSettingsState();
}

double? currentVolume;
WebRadio? webRadioSelectedItem;
bool? firstLoadSlider;
bool? firstLoadDropDown;

Future<double>? futureVolume;
Future<WebRadio>? futureActualPlaying;
Future<List<WebRadio>>? futureRadioList;

class _PageSettingsState extends State<PageSettings> {
  @override
  void initState() {
    super.initState();

    currentVolume = 0;

    futureRadioList = getRadios();
    futureVolume = getVolume();

    firstLoadSlider = true;
    firstLoadDropDown = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer("Raspbian Web Radio"),
            Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Station",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}





// import 'package:flutter/material.dart';

// class PageSettings extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Settings"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text('Go back!'),
//         ),
//       ),
//     );
//   }
// }
