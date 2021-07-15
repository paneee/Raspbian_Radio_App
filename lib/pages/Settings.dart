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

int? ip;
String? selectedTheme;

class _PageSettingsState extends State<PageSettings> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    ip = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            CustomHeaderContainer(
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
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child:
                    Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "API server network settings",
                    ),
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CustomTextInput(
                              labelText: "IP Address",
                              validator: (value) {
                                if (!Fzregex.hasMatch(value!, FzPattern.ipv4)) {
                                  return "Enter correct IP Address";
                                }
                                return null;
                              },
                            ),
                            CustomTextInput(
                              labelText: "Port number",
                              validator: (value) {
                                int temp = int.tryParse(value) ?? -1;
                                if ((temp < 1) || (temp > 65535)) {
                                  return "Enter correct port number";
                                }
                                return null;
                              },
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Application theme ",
                              ),
                            ),
                            CustomDropdownString(
                              value: "Two",
                              items: <String>[
                                'One',
                                'Two',
                                'Free',
                                'Four'
                              ].map<DropdownMenuItem<String>>((String value) {
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
                            Container(
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                "Save setting",
                              ),
                            ),
                            CustomButton(
                              btnText: "Save",
                              onClick: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('Settings saved')));
                                }
                              },
                            ),
                          ]))
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
