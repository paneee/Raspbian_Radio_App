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

String? _selectedTheme;

var _itemTheme;
var preferences;

class _PageSettingsState extends State<PageSettings> {
  final _formKey = GlobalKey<FormState>();
  String _ip = "";
  String _port = "";
  var controllerIp = TextEditingController();
  var controllerPort = TextEditingController();

  @override
  void initState() {
    super.initState();

    _itemTheme = ['Red', 'Blue', 'Green', 'Orange'];
    _selectedTheme = 'Red';

    initPreferences();
  }

  void initPreferences() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      _ip = (preferences.getString('ip') ?? "192.168.1.50");
      _port = (preferences.getString('port') ?? "5000");
      controllerIp.text = _ip;
      controllerPort.text = _port;
    });
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
                  controller: controllerIp,
                  labelText: "IP Address",
                  validator: (value) {
                    if (!Fzregex.hasMatch(value!, FzPattern.ipv4)) {
                      return "Enter correct IP Address";
                    } else {
                      _ip = value;
                      preferences.setString("ip", value);
                      controllerIp.text = _ip;
                      return null;
                    }
                  },
                )),
            Container(
                margin: EdgeInsets.only(right: 30, left: 30),
                child: CustomTextInput(
                  controller: controllerPort,
                  labelText: "Port number",
                  validator: (value) {
                    int temp = int.tryParse(value) ?? -1;
                    if ((temp < 1) || (temp > 65535)) {
                      return "Enter correct port number";
                    } else {
                      _port = value.toString();
                      preferences.setString("port", value.toString());
                      controllerPort.text = _port;
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
                setState(() {});
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
