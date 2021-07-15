import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextInput extends StatefulWidget {
  var validator;
  var textValidator;
  var labelText;

  CustomTextInput({this.validator, this.textValidator, this.labelText});

  @override
  _CustomTextInputState createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: TextFormField(
                decoration: InputDecoration(
                    errorStyle: TextStyle(fontSize: 10.0),
                    labelText: this.widget.labelText,
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        )),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(color: Colors.black, width: 1.0))),
                style: TextStyle(color: Colors.black),
                validator: this.widget.validator),
          ),
        ]);
  }
}
