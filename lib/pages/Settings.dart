import 'package:raspbian_radio_app/widgets/DropdownString.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:raspbian_radio_app/widgets/TextInput.dart';
import 'package:raspbian_radio_app/widgets/Herder.dart';
import 'package:raspbian_radio_app/widgets/Button.dart';
import 'package:fzregex/utils/fzregex.dart';
import 'package:fzregex/utils/pattern.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageSettings extends StatefulWidget {
  @override
  _PageSettingsState createState() => _PageSettingsState();
}

String? _ip;
String? _selectedTheme;
String? _port;
var _itemTheme;

class _PageSettingsState extends State<PageSettings> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    //_ip = "192.168.1.50";
    //_port = "5000";
    _itemTheme = ['Red', 'Blue', 'Green', 'Orange'];
    _selectedTheme = 'Red';
    _getIpSetting();
    _getPortSetting();
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
                  initialValue: _ip,
                  labelText: "IP Address",
                  validator: (value) {
                    if (!Fzregex.hasMatch(value!, FzPattern.ipv4)) {
                      return "Enter correct IP Address";
                    } else {
                      print(value);
                      _saveIpSetting(value);
                      return null;
                    }
                  },
                )),
            Container(
                margin: EdgeInsets.only(right: 30, left: 30),
                child: CustomTextInput(
                  initialValue: _port,
                  labelText: "Port number",
                  validator: (value) {
                    int temp = int.tryParse(value) ?? -1;
                    if ((temp < 1) || (temp > 65535)) {
                      return "Enter correct port number";
                    } else {
                      print(temp);
                      _savePortSetting(temp);
                      return null;
                    }
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

void _saveIpSetting(ip) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString("ip", ip);
}

void _savePortSetting(port) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString("port", port);
}

void _getIpSetting() async {
  final prefs = await SharedPreferences.getInstance();
  _ip = prefs.getString('ip') ?? "";
}

void _getPortSetting() async {
  final prefs = await SharedPreferences.getInstance();
  _ip = prefs.getString('port') ?? "";
}
