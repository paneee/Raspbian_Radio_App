import 'package:flutter/material.dart';
import 'package:fzregex/utils/fzregex.dart';
import 'package:fzregex/utils/pattern.dart';
import 'package:raspbian_radio_app/utils/Syle.dart';
import 'package:raspbian_radio_app/widgets/Button.dart';

// ignore: must_be_immutable
class CustomTextInput extends StatefulWidget {
  var hint;

  CustomTextInput({this.hint});

  @override
  _CustomTextInputState createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                    decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 18.0),
                        labelText: "IP Address",
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
                    validator: (value) {
                      if (!Fzregex.hasMatch(value!, FzPattern.ipv4)) {
                        return 'Enter a valid IP Address';
                      }
                      return null;
                    }),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextFormField(
                    decoration: InputDecoration(
                        errorStyle: TextStyle(fontSize: 18.0),
                        labelText: "Port number",
                        filled: true,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                              color: Colors.blue,
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0))),
                    style: TextStyle(color: Colors.black),
                    validator: (value) {
                      int intVal = int.tryParse(value!) ?? -1;
                      if (!((intVal > 0) && (intVal < 65535))) {
                        return 'Enter a valid port number';
                      }
                      return null;
                    }),
              ),
              Container(
                  child: CustomButton(
                btnText: "Save",
                onClick: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Settings saved')));
                  }
                },
              ))
            ]));
  }
}
