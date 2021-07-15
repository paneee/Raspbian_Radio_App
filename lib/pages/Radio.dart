import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:raspbian_radio_app/api/api.dart';
import 'package:raspbian_radio_app/models/WebRadios.dart';
import 'package:raspbian_radio_app/widgets/Button.dart';
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
bool? firstLoadSlider;
bool? firstLoadDropDown;

Future<double>? futureVolume;
Future<WebRadio>? futureActualPlaying;
Future<List<WebRadio>>? futureRadioList;

class _PageRadioState extends State<PageRadio> {
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
        child: Column(
          children: <Widget>[
            CustomHeaderContainer(
                text: "Raspbian Web Radio",
                item: IconButton(
                  icon: FaIcon(FontAwesomeIcons.cogs,
                      color: Colors.white, size: 32),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PageSettings()),
                    );
                  },
                )),
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Station",
                    ),
                  ),
                  Container(
                      child: FutureBuilder<List<WebRadio>>(
                    future: futureRadioList,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        if ((snapshot.connectionState ==
                                ConnectionState.done) &&
                            (firstLoadDropDown == true)) {
                          for (WebRadio item in snapshot.data!) {
                            if (item.isPlaying == true) {
                              webRadioSelectedItem = item;
                            }
                          }
                          firstLoadDropDown = false;
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
                          items: snapshot.data!.map((WebRadio value) {
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
                        return Text("No connection to the API swerer");
                      }
                      return CircularProgressIndicator();
                    },
                  )),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Control",
                    ),
                  ),
                  Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                        Center(
                          child: CustomButton(
                            onClick: () {
                              setState(() {
                                playRadio(webRadioSelectedItem!);
                              });
                            },
                            btnText: "Play",
                          ),
                        ),
                        Center(
                          child: CustomButton(
                            onClick: () {
                              setState(() {
                                stopRadio();
                              });
                            },
                            btnText: "Stop",
                          ),
                        ),
                      ])),
                  Container(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Volume",
                    ),
                  ),
                  Container(
                      child: FutureBuilder<double>(
                          future: futureVolume,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
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
                                    setVolume(currentVolume!);
                                  });
                                },
                              );
                            } else if (snapshot.hasError) {
                              return Text("No connection to the API swerer");
                            }
                            return CircularProgressIndicator();
                          })),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
