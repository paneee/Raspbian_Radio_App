import 'package:raspbian_radio_app/pages/Test.dart';
import 'package:raspbian_radio_app/utils/Syle.dart';
import 'package:raspbian_radio_app/widgets/DropdownString.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:raspbian_radio_app/widgets/TextInput.dart';
import 'package:raspbian_radio_app/widgets/Herder.dart';
import 'package:raspbian_radio_app/widgets/Button.dart';
import 'package:fzregex/utils/fzregex.dart';
import 'package:fzregex/utils/pattern.dart';
import 'package:flutter/material.dart';

class PageSettings extends StatefulWidget {
  @override
  _PageSettingsState createState() => _PageSettingsState();
}

String? _ip;
String? _selectedTheme;
String? _port;
var _itemTheme;
var _ipController = TextEditingController(text: "192.168.1.50");
var _portController = TextEditingController(text: "5000");

class _PageSettingsState extends State<PageSettings> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _ip = "192.168.1.50";
    _port = "5000";
    _itemTheme = ['Red', 'Blue', 'Green', 'Orange'];
    _selectedTheme = 'Red';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
            child: CustomHeaderContainer(
                text: "Raspbian Web Radio",
                item: IconButton(
                  icon: FaIcon(FontAwesomeIcons.arrowCircleLeft,
                      color: Colors.white, size: 32),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ))),
        Form(
          key: _formKey,
          child: Column(children: [
            Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(top: 20, right: 50, bottom: 10),
                child: Text(
                  "Network setting",
                  textAlign: TextAlign.right,
                )),
            Container(
                margin: EdgeInsets.only(right: 30, left: 30),
                child: CustomTextInput(
                  //textController: _ipController,
                  initialValue: _ip,
                  labelText: "IP Address",
                  validator: (value) {
                    if (!Fzregex.hasMatch(value!, FzPattern.ipv4)) {
                      print(_ipController.text);
                      return "Enter correct IP Address";
                    }
                    return null;
                  },
                )),
            Container(
                margin: EdgeInsets.only(right: 30, left: 30),
                child: CustomTextInput(
                  //textController: _ipController,
                  initialValue: _port,
                  labelText: "Port number",
                  validator: (value) {
                    int temp = int.tryParse(value) ?? -1;
                    if ((temp < 1) || (temp > 65535)) {
                      print(_portController.text);
                      return "Enter correct port number";
                    }
                    return null;
                  },
                ))
          ]),
        ),
        Column(children: [
          Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 50, bottom: 10),
              child: Text(
                "Theme select",
              )),
          Container(
            margin: EdgeInsets.only(
              right: 30,
              left: 30,
            ),
            child: CustomDropdownString(
              value: _selectedTheme,
              onChanged: (newValue) {
                _selectedTheme = newValue;
              },
              items: _itemTheme.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                );
              }).toList(),
            ),
          )
        ]),
        Column(children: [
          Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 50, bottom: 10),
              child: Text(
                "Save settings",
              )),
          Container(
            margin: EdgeInsets.only(right: 30, left: 30, bottom: 50),
            child: CustomButton(
              btnText: "Save",
              onClick: () {
                if (_formKey.currentState!.validate()) {
                  //mainSQLite();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: Colors.red[500],
                      content: Text(
                        'Settings saved',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )));
                }
              },
            ),
          )
        ]),
      ],
    ));
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Column(
//           children: <Widget>[
//             CustomHeaderContainer(
//                 text: "Raspbian Web Radio",
//                 item: IconButton(
//                   icon: FaIcon(FontAwesomeIcons.arrowCircleLeft,
//                       color: Colors.white, size: 38),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 )),
//             Expanded(
//               flex: 1,
//               child: Container(
//                 margin: EdgeInsets.only(left: 20, right: 20, top: 20),
//                 child:
//                     Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
//                   Container(
//                     alignment: Alignment.centerRight,
//                     child: Text(
//                       "API server network settings",
//                     ),
//                   ),
//                   Form(
//                       key: _formKey,
//                       child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             // CustomTextInput(
//                             //   //textController: _ipController,
//                             //   initialValue: _ip,
//                             //   labelText: "IP Address",
//                             //   validator: (value) {
//                             //     if (!Fzregex.hasMatch(value!, FzPattern.ipv4)) {
//                             //       print(_ipController.text);
//                             //       return "Enter correct IP Address";
//                             //     }
//                             //     return null;
//                             //   },
//                             // ),
//                             // CustomTextInput(
//                             //   //textController: _portController,
//                             //   initialValue: _port,
//                             //   labelText: "Port number",
//                             //   validator: (value) {
//                             //     int temp = int.tryParse(value) ?? -1;
//                             //     if ((temp < 1) || (temp > 65535)) {
//                             //       print(_portController.text);
//                             //       return "Enter correct port number";
//                             //     }
//                             //     return null;
//                             //   },
//                             // ),
//                             // Container(
//                             //   margin: EdgeInsets.only(top: 10),
//                             //   alignment: Alignment.centerRight,
//                             //   child: Text(
//                             //     "Application theme ",
//                             //   ),
//                             // ),
//                             // CustomDropdownString(
//                             //   value: _selectedTheme,
//                             //   onChanged: (newValue) {
//                             //     _selectedTheme = newValue;
//                             //   },
//                             //   items: _itemTheme.map<DropdownMenuItem<String>>(
//                             //       (String value) {
//                             //     return DropdownMenuItem<String>(
//                             //       value: value,
//                             //       child: Text(
//                             //         value,
//                             //         style: TextStyle(
//                             //             fontSize: 20,
//                             //             color: Colors.white,
//                             //             fontWeight: FontWeight.bold),
//                             //       ),
//                             //     );
//                             //   }).toList(),
//                             // ),
//                             // Container(
//                             //   alignment: Alignment.centerRight,
//                             //   margin: EdgeInsets.only(top: 10),
//                             //   child: Text(
//                             //     "Save setting",
//                             //   ),
//                             // ),
//                             MyCustomForm(),
//                             // CustomButton(
//                             //   btnText: "Save",
//                             //   onClick: () {
//                             //     if (_formKey.currentState!.validate()) {
//                             //       //mainSQLite();
//                             //       ScaffoldMessenger.of(context).showSnackBar(
//                             //           SnackBar(
//                             //               content: Text('Settings saved')));
//                             //     }
//                             //   },
//                             // ),
//                           ]))
//                 ]),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
