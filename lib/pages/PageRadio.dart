import 'package:flutter/material.dart';
import 'package:raspbian_radio_app/api/api.dart';
import 'package:raspbian_radio_app/utils/Syle.dart';
import 'package:raspbian_radio_app/utils/WebRadios.dart';
import 'package:raspbian_radio_app/widgets/CustomDropdown.dart';
import 'package:raspbian_radio_app/widgets/CustomButtonWidget.dart';
import 'package:raspbian_radio_app/widgets/HerderContainer.dart';
import 'package:raspbian_radio_app/widgets/CustomSliderWidget.dart';

class RadioPage extends StatefulWidget {
  @override
  _RadioPageState createState() => _RadioPageState();
}

double? currentVolume;
WebRadio? webRadioSelectedItem;

Future<double>? futureVolume;
Future<WebRadio>? futureActualPlaying;
Future<List<WebRadio>>? futureRadioList;

//bool firstloadslider = true;

class _RadioPageState extends State<RadioPage> {
  @override
  void initState() {
    super.initState();

    currentVolume = 0;

    futureRadioList = getRadios();
    futureVolume = getVolume();
    futureActualPlaying = getPlayingStation();
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
                        "Stacja",
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder<List<WebRadio>>(
                        future: futureRadioList,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return CustomDropdown(
                              value: webRadioSelectedItem,
                              hint: Text(
                                "Wybierz stację",
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
                            return Text("${snapshot.error}");
                          }
                          return CircularProgressIndicator();
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Sterowanie",
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: CustomButtonWidget(
                          onClick: () {},
                          btnText: "Play",
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: CustomButtonWidget(
                          onClick: () {},
                          btnText: "Stop",
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Głośność",
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: CustomSliderWidget(
                          min: 0,
                          max: 100,
                          onChanged: (volume) {
                            setState(() {
                              currentVolume = volume;
                            });
                          },
                          onChangeEnd: (_) {
                            setState(() {
                              //setVolume(currentVolume);
                            });
                          },
                          sliderHeight: 60,
                          fullWidth: true,
                          value: currentVolume,
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "© 2021",
                            style: TextStyle(color: Colors.black)),
                      ]),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
