import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fzregex/utils/fzregex.dart';
import 'package:fzregex/utils/pattern.dart';
import 'package:raspbian_radio_app/widgets/Button.dart';
import 'package:raspbian_radio_app/widgets/TextInput.dart';
import 'package:raspbian_radio_app/widgets/Herder.dart';

class PageSettings extends StatefulWidget {
  @override
  _PageSettingsState createState() => _PageSettingsState();
}

int? ip;

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
            padding: EdgeInsets.only(bottom: 30),
            child: Column(children: <Widget>[
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
                            CustomButton(
                              btnText: "Save",
                              onClick: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('Settings saved')));
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ])));
  }
}
