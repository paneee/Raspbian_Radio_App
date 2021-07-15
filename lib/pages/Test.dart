import 'package:flutter/material.dart';

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  MyCustomForm();

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();
  final textController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        padding: EdgeInsets.all(10.0),
        child: TextFormField(
          controller: textController,
          //initialValue: this.widget.initialValue,
          decoration: InputDecoration(
              errorStyle: TextStyle(fontSize: 10.0),
              //labelText: this.widget.labelText,
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
          //validator: this.widget.validator),
        ),
        // TextField(
        //   controller: textController,
        // ),
        // FloatingActionButton(
        //   // When the user presses the button, show an alert dialog containing
        //   // the text that the user has entered into the text field.
        //   onPressed: () {
        //     showDialog(
        //       context: context,
        //       builder: (context) {
        //         return AlertDialog(
        //           // Retrieve the text the that user has entered by using the
        //           // TextEditingController.
        //           content: Text(myController.text),
        //         );
        //       },
        //     );
        //   },
        // ),
      )
    ]);
  }
}
