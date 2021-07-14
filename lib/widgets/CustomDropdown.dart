import 'package:flutter/material.dart';
import 'package:raspbian_radio_app/utils/Syle.dart';
import 'package:raspbian_radio_app/models/WebRadios.dart';

// ignore: must_be_immutable
class CustomDropdown extends StatefulWidget {
  var hint;
  var items;
  var onChanged;
  var value;

  CustomDropdown({this.hint, this.items, this.onChanged, this.value});

  @override
  State<StatefulWidget> createState() {
    return _CustomDropdownState();
  }
}

class _CustomDropdownState extends State<CustomDropdown> {
  int currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: darkColor,
                ),
                child: DropdownButton<WebRadio>(
                  value: this.widget.value,
                  hint: this.widget.hint,
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.white),
                  underline: Container(
                    height: 0,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: this.widget.onChanged,
                  items: this.widget.items,
                )),
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [darkColor, lightColor],
                  end: Alignment.centerLeft,
                  begin: Alignment.centerRight),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            alignment: Alignment.center,
          )
        ],
      ),
    );
  }
}
