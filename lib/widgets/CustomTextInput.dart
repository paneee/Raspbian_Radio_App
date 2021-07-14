import 'package:flutter/material.dart';
import 'package:fzregex/utils/fzregex.dart';
import 'package:fzregex/utils/pattern.dart';

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
                      labelText: this.widget.hint,
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
                      labelText: this.widget.hint,
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
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Settings saved')));
                  }
                },
                child: Text('Save'),
              ),
            ),
          ],
        ));
  }
}



//////////////////////////////////////////////////////////////////////////////
// TextFormField(
//                   textAlignVertical: TextAlignVertical.center,
//                   textAlign: TextAlign.center,
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     //fillColor: Colors.red,
//                     disabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25.0),
//                       borderSide: BorderSide(
//                         color: Colors.black,
//                       ),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25.0),
//                       borderSide: BorderSide(
//                         color: Colors.orange,
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25.0),
//                       borderSide: BorderSide(
//                         color: Colors.blue,
//                       ),
//                     ),
//                     errorBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25.0),
//                       borderSide: BorderSide(
//                         color: Colors.red,
//                         width: 2.0,
//                       ),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (!Fzregex.hasMatch(value!, FzPattern.ipv4)) {
//                       return 'vffvfd';
//                     }
//                     return null;
//                   }),
///////////////////////////////////////////////////////////////////////////////


//   @override
//   Widget build(BuildContext context) {
//     return Form(
//         key: _formKey,
//         child: Column(children: <Widget>[
//           Container(
//               padding: const EdgeInsets.all(20.0),
//               child: TextFormField(
//                 //controller: textController,
//                 decoration: new InputDecoration(
//                     errorStyle: TextStyle(fontSize: 18.0),
//                     labelText: 'Hint text',
//                     filled: true,
//                     fillColor: Colors.white,
//                     enabledBorder: new OutlineInputBorder(
//                       borderRadius: new BorderRadius.circular(25.0),
//                       borderSide: new BorderSide(
//                         color: Colors.grey,
//                       ),
//                     ),
//                     focusedBorder: new OutlineInputBorder(
//                         borderRadius: new BorderRadius.circular(25.0),
//                         borderSide: new BorderSide(
//                           color: Colors.blue,
//                         )),
//                     border: OutlineInputBorder(
//                         borderRadius: new BorderRadius.circular(25.0),
//                         borderSide:
//                             BorderSide(color: Colors.black, width: 1.0))),
//                 style: new TextStyle(color: Colors.black),
//                 validator: (value) {
//                   if (value!.isEmpty) {
//                     return '\u26A0 Field is empty.';
//                   }
//                   return null;
//                 },
//               )),
//           Center(
//               child: Padding(
//             padding: EdgeInsets.only(top: 20.0),
//             child: RaisedButton(
//               onPressed: () {
//                 // Validate returns true if the form is valid, otherwise false.
//                 if (_formKey.currentState!.validate()) {
//                   // If the form is valid, display a snackbar. In the real world,
//                   // you'd often call a server or save the information in a database.

//                   Scaffold.of(context)
//                       .showSnackBar(SnackBar(content: Text('Processing Data')));
//                 }
//               },
//               child: Text('Submit'),
//             ),
//           ))
//         ]));
//   }
// }




////////////////////////////////////////////////////////////////////////////










 //

//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[

//           TextFormField(
//             validator: (value) {
//               if (!Fzregex.hasMatch(value!, FzPattern.ipv4)) {
//                 return 'Please enter the correct ip ';
//               }
//               return null;
//             },
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 10),
//             child: ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   ScaffoldMessenger.of(context)
//                       .showSnackBar(SnackBar(content: Text('Settings saver')));
//                 }
//               },
//               child: Text('Save'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ignore: non_constant_identifier_names
// Widget TextInput({controller, hint, context, value}) {
//   return Container(
//       margin: EdgeInsets.only(top: 20),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(20)),
//         color: Colors.white,
//       ),
//       padding: EdgeInsets.only(left: 10),
//       child: TextFormField(
//           controller: controller,
//           decoration: InputDecoration(border: InputBorder.none, hintText: hint),
//           validator: (value) {
//             if (value == null || value.isEmpty) {
//               return 'Please enter some text';
//             }
//           }));

// String contactNumber;
// String pin;
// return Form(
//   key: _formKey,
//   child: Column(
//     children: <Widget>[
//       TextFormField(
//         onSaved: (String value){contactNumber=value;},
//         keyboardType: TextInputType.phone,
//         inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
//         maxLength: 10,
//         decoration: InputDecoration(
//             labelText: "Enter Your Mobile Number",
//             hintText: "Number",
//             icon: Icon(Icons.phone_iphone)),
//         validator: (value) {
//           if (value.isEmpty || value.length < 10) {
//             return 'Please Enter 10 digit number';
//           }
//           return null;
//         },
//       ),
//       TextFormField(
//         onSaved: (String value){pin=value;},
//         keyboardType: TextInputType.phone,
//         inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
//         maxLength: 10,
//         decoration: InputDecoration(
//             labelText: "Enter Your PIN",
//             hintText: "Number",
//             icon: Icon(Icons.lock)),
//         validator: (value) {
//           if (value.isEmpty || value.length < 6) {
//             return 'Please Enter 6 digit PIN';
//           }
//           return null;
//         },
//       ),
//       Padding(
//         padding: const EdgeInsets.symmetric(vertical: 16.0),
//         child: RaisedButton(
//             color: Colors.black,
//             textColor: Colors.white,
//             onPressed: () {
//               if (_formKey.currentState.validate()) {
//                 ***_formKey.currentState.save();***
//                 bloc.loginUser(contactNumber, pin);
//               }
//             },
//             child: Text('Login' /*style: TextStyle(fontSize: 30),*/)),
//       )
//     ],
//   ),
// );
