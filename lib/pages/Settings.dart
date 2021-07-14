import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:raspbian_radio_app/widgets/CustomTextInput.dart';
import 'package:raspbian_radio_app/widgets/HerderContainer.dart';

class PageSettings extends StatefulWidget {
  @override
  _PageSettingsState createState() => _PageSettingsState();
}

int? ip;

class _PageSettingsState extends State<PageSettings> {
  @override
  void initState() {
    super.initState();
    ip = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 30),
        child: Column(
          children: <Widget>[
            HeaderContainer(
                text: "Raspbian Web Radio",
                item: IconButton(
                  icon: FaIcon(FontAwesomeIcons.arrowCircleLeft,
                      color: Colors.white, size: 38),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )),
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
                        "API server network settings",
                      ),
                    ),
                    CustomTextInput(
                      hint: "IP Address",
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
