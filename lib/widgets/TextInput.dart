import 'package:flutter/material.dart';
import 'package:fzregex/utils/fzregex.dart';
import 'package:fzregex/utils/pattern.dart';
import 'package:raspbian_radio_app/widgets/Button.dart';

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
  //final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return
        //  return Form(
        //    key: _formKey,
        //     child:
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Container(
        padding: EdgeInsets.all(20.0),
        child: TextFormField(
            decoration: InputDecoration(
                errorStyle: TextStyle(fontSize: 18.0),
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
                    borderSide: BorderSide(color: Colors.black, width: 1.0))),
            style: TextStyle(color: Colors.black),
            validator: this.widget.validator),
      ),

      // Container(
      //     child: CustomButton(
      //   btnText: "Save",
      //   onClick: () {
      //     if (_formKey.currentState!.validate()) {
      //       ScaffoldMessenger.of(context).showSnackBar(
      //           SnackBar(content: Text('Settings saved')));
      //     }
      //   },
    ]);
  }
}
