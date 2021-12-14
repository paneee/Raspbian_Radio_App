import 'package:raspbian_radio_app/models/Settings.dart';
import 'package:raspbian_radio_app/pages/Radio.dart';
import 'package:raspbian_radio_app/utils/Preferences.dart';
import 'package:raspbian_radio_app/utils/Syle.dart';
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

String? selectedTheme;

var itemTheme;
var preferences;

class _PageSettingsState extends State<PageSettings> {
  final formKey = GlobalKey<FormState>();

  var controllerIp = TextEditingController();
  var controllerRadioPort = TextEditingController();
  var controllerSpeakerPort = TextEditingController();

  @override
  void initState() {
    super.initState();
    savePreferences(new Settings(
        ip: controllerIp.text,
        radioPort: controllerRadioPort.text,
        speakerPort: controllerSpeakerPort.text,
        color: selectedTheme));

    itemTheme = ['Red', 'Blue', 'Green', 'Orange'];
  }

  void savePreferences(Settings settigs) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setString(settigs.ip, 'ip');
    preferences.setString(settigs.radioPort, 'radioPort');
    preferences.setString(settigs.speakerPort, 'speakerPort');
    preferences.setString(settigs.color, 'color');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Settings>(
            future: SharedPreferencesHelper.getSettings(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                ip = snapshot.data!.ip;
                radioPort = snapshot.data!.radioPort;
                speakerPort = snapshot.data!.speakerPort;
                selectedTheme = snapshot.data!.color;

                selectColor(selectedTheme!);
                controllerIp.text = ip!;
                controllerRadioPort.text = radioPort!;
                controllerSpeakerPort.text = speakerPort!;
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                      child: CustomHeaderContainer(
                          text: "Raspbian Web Radio",
                          item: IconButton(
                            icon: FaIcon(FontAwesomeIcons.arrowCircleLeft,
                                color: Colors.white, size: 32),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PageRadio()),
                              );
                            },
                          ))),
                  Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(
                                  top: 20, right: 50, bottom: 10),
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
                                  if (!Fzregex.hasMatch(
                                      value!, FzPattern.ipv4)) {
                                    return "Enter correct IP Address";
                                  } else {
                                    ip = value;
                                    preferences.setString("ip", value);
                                    controllerIp.text = ip!;
                                    return null;
                                  }
                                },
                              )),
                          Column(
                            children: [
                              Row(children: [
                                Flexible(
                                  child: Container(
                                      margin:
                                          EdgeInsets.only(right: 30, left: 30),
                                      child: CustomTextInput(
                                        controller: controllerRadioPort,
                                        labelText: "Radio port number",
                                        validator: (value) {
                                          int temp = int.tryParse(value) ?? -1;
                                          if ((temp < 1) || (temp > 65535)) {
                                            return "Enter correct port number";
                                          } else {
                                            radioPort = value.toString();
                                            preferences.setString(
                                                "radioPort", value.toString());
                                            controllerRadioPort.text =
                                                radioPort!;
                                            return null;
                                          }
                                        },
                                      )),
                                ),
                                Flexible(
                                  child: Container(
                                      margin:
                                          EdgeInsets.only(right: 30, left: 30),
                                      child: CustomTextInput(
                                        controller: controllerSpeakerPort,
                                        labelText: "Speaker port number",
                                        validator: (value) {
                                          int temp = int.tryParse(value) ?? -1;
                                          if ((temp < 1) || (temp > 65535)) {
                                            return "Enter correct port number";
                                          } else {
                                            speakerPort = value.toString();
                                            preferences.setString("speakerPort",
                                                value.toString());
                                            controllerSpeakerPort.text =
                                                radioPort!;
                                            return null;
                                          }
                                        },
                                      )),
                                )
                              ])
                            ],
                          ),

                          // Container(
                          //     margin: EdgeInsets.only(right: 30, left: 30),
                          //     child: CustomTextInput(
                          //       controller: controllerRadioPort,
                          //       labelText: "Radio port number",
                          //       validator: (value) {
                          //         int temp = int.tryParse(value) ?? -1;
                          //         if ((temp < 1) || (temp > 65535)) {
                          //           return "Enter correct port number";
                          //         } else {
                          //           radioPort = value.toString();
                          //           preferences.setString(
                          //               "radioPort", value.toString());
                          //           controllerRadioPort.text = radioPort!;
                          //           return null;
                          //         }
                          //       },
                          //     )),
                          // Container(
                          //     margin: EdgeInsets.only(right: 30, left: 30),
                          //     child: CustomTextInput(
                          //       controller: controllerSpeakerPort,
                          //       labelText: "Speaker port number",
                          //       validator: (value) {
                          //         int temp = int.tryParse(value) ?? -1;
                          //         if ((temp < 1) || (temp > 65535)) {
                          //           return "Enter correct port number";
                          //         } else {
                          //           speakerPort = value.toString();
                          //           preferences.setString(
                          //               "speakerPort", value.toString());
                          //           controllerSpeakerPort.text =
                          //               speakerPort!;
                          //           return null;
                          //         }
                          //       },
                          //     ))
                        ],
                      )),
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
                        value: selectedTheme,
                        onChanged: (value) {
                          setState(() {
                            selectedTheme = value;
                            preferences.setString("color", value);
                          });
                        },
                        items: itemTheme
                            .map<DropdownMenuItem<String>>((String value) {
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
                          setState(() {
                            savePreferences(new Settings(
                                ip: controllerIp.text,
                                radioPort: controllerRadioPort.text,
                                speakerPort: controllerSpeakerPort.text,
                                color: selectedTheme));
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PageSettings()),
                            );
                          });
                          if (formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: lightColor,
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
              );
            }));
  }
}
