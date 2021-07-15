import 'package:flutter/material.dart';
import 'package:raspbian_radio_app/utils/Syle.dart';

// ignore: must_be_immutable
class CustomDropdownString extends StatefulWidget {
  var hint;
  var items;
  var onChanged;
  var value;

  CustomDropdownString({this.hint, this.items, this.onChanged, this.value});

  @override
  State<StatefulWidget> createState() {
    return _CustomDropdownStringState();
  }
}

class _CustomDropdownStringState extends State<CustomDropdownString> {
  int currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(2.0),
            margin: EdgeInsets.all(12.0),
            child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: darkColor,
                ),
                child: DropdownButton<String>(
                    style: const TextStyle(color: Colors.white),
                    value: "Two",
                    underline: Container(
                      height: 0,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        //selectedTheme = value!;
                      });
                    },
                    items: this.widget.items)),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [darkColor, lightColor],
                  end: Alignment.centerLeft,
                  begin: Alignment.centerRight),
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            alignment: Alignment.center,
          )
        ]);
  }
}
