import 'package:flutter/material.dart';
import '/utils/color.dart';

class DropdownIssue extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DropdownIssueState();
  }
}

class _DropdownIssueState extends State<DropdownIssue> {
  int currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
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
            child: DropdownButton<String>(
              value: 'Two',
              //icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.white),
              underline: Container(
                height: 0,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {});
              },
              items: <String>['One', 'Two', 'Free', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      "One",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ));
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
