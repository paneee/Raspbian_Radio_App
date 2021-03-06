import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:raspbian_radio_app/api/Api.dart';
import 'package:raspbian_radio_app/models/Settings.dart';
import 'package:raspbian_radio_app/models/Tv.dart';
import 'package:raspbian_radio_app/models/WebRadios.dart';
import 'package:raspbian_radio_app/utils/Preferences.dart';
import 'package:raspbian_radio_app/utils/Syle.dart';
import 'package:raspbian_radio_app/widgets/Button.dart';
import 'package:raspbian_radio_app/widgets/DropdownTvCommand.dart';
import 'package:raspbian_radio_app/widgets/DropdownWebRadio.dart';
import 'package:raspbian_radio_app/widgets/Herder.dart';
import 'package:raspbian_radio_app/widgets/Slider.dart';
import 'package:raspbian_radio_app/pages/Settings.dart';

class PageRadio extends StatefulWidget {
  @override
  _PageRadioState createState() => _PageRadioState();
}

double? currentVolume;

WebRadio? webRadioSelectedItem;
ApiCommand? tvCommandSelectedItem;

ApiCommand? lightCommand =
    new ApiCommand(name: "toggleLight", content: "toggleLight_1");

bool? firstLoadSlider;
bool? firstLoadWebRadioDropDown;
bool? firstLoadTvCommandDropDown;

Future<double>? futureVolume;
Future<WebRadio>? futureActualPlaying;

Future<List<WebRadio>>? futureRadioList;
Future<List<ApiCommand>>? fututeCommandList;

Future<Settings>? futureSettings;
String? ip;
String? port;
String? color;

class _PageRadioState extends State<PageRadio> {
  @override
  void initState() {
    super.initState();

    currentVolume = 0;

    firstLoadSlider = true;
    firstLoadWebRadioDropDown = true;
    firstLoadTvCommandDropDown = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<Settings>(
            future: SharedPreferencesHelper.getSettings(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                ip = snapshot.data!.ip;
                port = snapshot.data!.port;
                color = snapshot.data!.color;
                selectColor(color!);
              }
              return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        child: CustomHeaderContainer(
                            text: "Raspbian Web Radio",
                            item: IconButton(
                              icon: FaIcon(FontAwesomeIcons.cogs,
                                  color: Colors.white, size: 32),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PageSettings()),
                                );
                              },
                            ))),
                    Expanded(
                        child: SingleChildScrollView(
                            child: ConstrainedBox(
                      constraints: BoxConstraints(),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Container(
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(
                                  top: 25, right: 50, bottom: 10),
                              child: Text(
                                "Speaker",
                                textAlign: TextAlign.right,
                              )),
                          Container(
                            margin: EdgeInsets.only(right: 30.0, left: 30.0),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    child: CustomButton(
                                      onClick: () {
                                        setState(() {
                                          speakerToggle(ip!, port!);
                                        });
                                      },
                                      btnText: "On Off",
                                    ),
                                  ),
                                  Container(
                                    child: CustomButton(
                                      onClick: () {
                                        setState(() {
                                          speakerVolumeDOWN(ip!, port!);
                                        });
                                      },
                                      btnText: "Vol -",
                                    ),
                                  ),
                                  Container(
                                    child: CustomButton(
                                      onClick: () {
                                        setState(() {
                                          speakerVolumeUP(ip!, port!);
                                        });
                                      },
                                      btnText: "Vol +",
                                    ),
                                  ),
                                ]),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(right: 50, bottom: 10),
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 30.0, left: 30.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: CustomButton(
                                        onClick: () {
                                          setState(() {
                                            speakerBtConnect(ip!, port!);
                                          });
                                        },
                                        btnText: "Bt Connect",
                                      ),
                                    ),
                                    Container(
                                      child: CustomButton(
                                        onClick: () {
                                          setState(() {
                                            speakerBtDisconnect(ip!, port!);
                                          });
                                        },
                                        btnText: "Bt Disconnect",
                                      ),
                                    ),
                                  ])),
                          Container(
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(
                                  top: 25, right: 50, bottom: 10),
                              child: Text(
                                "Radio",
                                textAlign: TextAlign.right,
                              )),
                          Container(
                              margin: EdgeInsets.only(right: 30.0, left: 30.0),
                              child: FutureBuilder<List<WebRadio>>(
                                future: getRadios(ip!, port!),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    if ((snapshot.connectionState ==
                                            ConnectionState.done) &&
                                        (firstLoadWebRadioDropDown == true)) {
                                      for (WebRadio item in snapshot.data!) {
                                        if (item.isPlaying == true) {
                                          webRadioSelectedItem = item;
                                        }
                                      }
                                      firstLoadWebRadioDropDown = false;
                                    }
                                    return CustomDropdownWebRadio(
                                      value: webRadioSelectedItem,
                                      hint: Text(
                                        "Select radio station",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      items:
                                          snapshot.data!.map((WebRadio value) {
                                        return DropdownMenuItem<WebRadio>(
                                          value: value,
                                          child: Text(
                                            value.name!,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (webRadio) {
                                        setState(() {
                                          webRadioSelectedItem = webRadio;
                                        });
                                      },
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text(
                                        "No connection to the API swerer");
                                  }
                                  return CircularProgressIndicator();
                                },
                              )),
                          Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(right: 50, bottom: 10),
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 30.0, left: 30.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: 10, left: 10),
                                      child: CustomButton(
                                        onClick: () {
                                          setState(() {
                                            playRadio(webRadioSelectedItem!,
                                                ip!, port!);
                                          });
                                        },
                                        btnText: "   Play   ",
                                      ),
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.only(right: 10, left: 10),
                                      child: CustomButton(
                                        onClick: () {
                                          setState(() {
                                            stopRadio(ip!, port!);
                                          });
                                        },
                                        btnText: "   Stop   ",
                                      ),
                                    ),
                                  ])),
                          Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(right: 50, bottom: 10),
                          ),
                          Container(
                              margin: EdgeInsets.only(right: 30.0, left: 30.0),
                              child: FutureBuilder<double>(
                                  future: getVolume(ip!, port!),
                                  //future: futureVolume,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      print(snapshot.data);
                                      if ((snapshot.connectionState ==
                                              ConnectionState.done) &&
                                          (firstLoadSlider == true)) {
                                        currentVolume = snapshot.data!;
                                        firstLoadSlider = false;
                                      }
                                      return CustomSlider(
                                        min: 0,
                                        max: 100,
                                        sliderHeight: 60,
                                        fullWidth: true,
                                        value: currentVolume,
                                        onChanged: (volume) {
                                          setState(() {
                                            currentVolume = volume;
                                          });
                                        },
                                        onChangeEnd: (_) {
                                          setState(() {
                                            setVolume(
                                                currentVolume!, ip!, port!);
                                          });
                                        },
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text(
                                          "No connection to the API swerer");
                                    }
                                    return CircularProgressIndicator();
                                  })),
                          Container(
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(
                                  top: 25, right: 50, bottom: 10),
                              child: Text(
                                "TV",
                                textAlign: TextAlign.right,
                              )),
                          Container(
                              margin: EdgeInsets.only(right: 30.0, left: 30.0),
                              child: FutureBuilder<List<ApiCommand>>(
                                future: getTvCommands(ip!, port!),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return CustomDropdownTvCommand(
                                      value: tvCommandSelectedItem,
                                      hint: Text(
                                        "Select tv command",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      items: snapshot.data!
                                          .map((ApiCommand value) {
                                        return DropdownMenuItem<ApiCommand>(
                                          value: value,
                                          child: Text(
                                            value.name!,
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (tvCommand) {
                                        setState(() {
                                          tvCommandSelectedItem = tvCommand;
                                        });
                                      },
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text(
                                        "No connection to the API swerer");
                                  }
                                  return CircularProgressIndicator();
                                },
                              )),
                          Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(right: 50, bottom: 10),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 30, left: 30),
                            child: CustomButton(
                              onClick: () {
                                setState(() {
                                  runApiCommand(
                                      tvCommandSelectedItem!, 'tv', ip!, port!);
                                });
                              },
                              btnText: "   Run   ",
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(right: 50, bottom: 10),
                          ),
                          Container(
                              alignment: Alignment.centerRight,
                              margin: EdgeInsets.only(
                                  top: 25, right: 50, bottom: 10),
                              child: Text(
                                "Light",
                                textAlign: TextAlign.right,
                              )),
                          Container(
                            margin: EdgeInsets.only(right: 30, left: 30),
                            child: CustomButton(
                              onClick: () {
                                setState(() {
                                  runApiCommand(
                                      lightCommand!, 'light', ip!, port!);
                                });
                              },
                              btnText: "   On / Off   ",
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            margin: EdgeInsets.only(right: 50, bottom: 10),
                          ),
                        ],
                      ),
                    )))
                  ]);
            }));
  }
}
