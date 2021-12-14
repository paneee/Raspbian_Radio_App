import 'package:flutter/material.dart';
import 'package:raspbian_radio_app/models/Tv.dart';
import 'package:raspbian_radio_app/utils/Syle.dart';

// ignore: must_be_immutable
class CustomDropdownTvCommand extends StatefulWidget {
  var hint;
  var items;
  var onChanged;
  var value;

  CustomDropdownTvCommand({this.hint, this.items, this.onChanged, this.value});

  @override
  State<StatefulWidget> createState() {
    return _CustomDropdownTvCommandState();
  }
}

class _CustomDropdownTvCommandState extends State<CustomDropdownTvCommand> {
  int currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Theme(
                data: Theme.of(context).copyWith(
                  canvasColor: darkColor,
                ),
                child: DropdownButton<ApiCommand>(
                  value: this.widget.value,
                  hint: this.widget.hint,
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
                Radius.circular(25),
              ),
            ),
            alignment: Alignment.center,
          )
        ],
      ),
    );
  }
}
