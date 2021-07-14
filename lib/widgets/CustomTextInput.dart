import 'package:flutter/material.dart';
import 'package:fzregex/fzregex.dart';
import 'package:fzregex/utils/pattern.dart';

class CustomTextInput extends StatefulWidget {
  var hint;

  CustomTextInput({this.hint});

  @override
  _CustomTextInputState createState() => _CustomTextInputState();
}

class _CustomTextInputState extends State<CustomTextInput> {
  final _formIpKey = GlobalKey<FormState>();
  final _formPortKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Form(
          key: _formIpKey,
          child: Container(
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            //padding: EdgeInsets.only(left: 10),
            child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.red,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 2.0,
                    ),
                  ),
                ),
                validator: (value) {
                  if (!Fzregex.hasMatch(value!, FzPattern.ipv4)) {
                    return 'Please enter the correct Ip';
                  }
                  return null;
                }),
          ),
        ),
        Form(
            key: _formPortKey,
            child: Container(
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              padding: EdgeInsets.only(left: 10),
              child: TextFormField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Port"),
                  validator: (value) {
                    if (!Fzregex.hasMatch(value!, FzPattern.numericOnly)) {
                      return 'Please enter the correct port';
                    }
                    return null;
                  }),
            )),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: ElevatedButton(
            onPressed: () {
              if ((_formIpKey.currentState!.validate()) &&
                  (_formPortKey.currentState!.validate())) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Settings saved')));
              }
            },
            child: Text('Save'),
          ),
        ),
      ],
    );
  }
}

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
