import 'package:flutter/material.dart';
import 'package:raspbian_radio_app/widgets/CustomDropdown.dart';
import 'package:raspbian_radio_app/widgets/CustomButtonWidget.dart';
import 'package:raspbian_radio_app/widgets/HerderContainer.dart';
import 'package:raspbian_radio_app/widgets/CustomSliderWidget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    Expanded(child: CustomDropdown()),
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
                          onChange: (_) {},
                          onChangeEnd: (_) {},
                          min: 0,
                          max: 100,
                          sliderHeight: 60,
                          fullWidth: true,
                          value: 0,
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
