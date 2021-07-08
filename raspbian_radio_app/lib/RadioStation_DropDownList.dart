// import 'package:flutter/material.dart';
// import 'package:raspbian_radio_app/Syle.dart';
// import 'WebRadios.dart';

// // ignore: must_be_immutable
// // ignore: camel_case_types
// class RadioStations_DropDownListWidget extends StatefulWidget {
//   RadioStations_DropDownListWidget(
//       {this.futureRadioList, this.webRadioSelectedItem});
//   Future<List<WebRadio>>? futureRadioList;
//   WebRadio? webRadioSelectedItem;

//   @override
//   _RadioStations_DropDownListWidgetState createState() =>
//       _RadioStations_DropDownListWidgetState();
// }

// // ignore: camel_case_types
// class _RadioStations_DropDownListWidgetState
//     extends State<RadioStations_DropDownListWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<WebRadio>>(
//       future: widget.futureRadioList,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return DropdownButton<WebRadio>(
//             value: widget.webRadioSelectedItem,
//             hint: StyledText("Wybierz stację"),
//             items: snapshot.data!.map((WebRadio value) {
//               return DropdownMenuItem<WebRadio>(
//                 value: value,
//                 child: new StyledText(value.name!),
//               );
//             }).toList(),
//             onChanged: (webRadio) {
//               setState(() {
//                 widget.webRadioSelectedItem = webRadio;
//                 //print(widget.webRadioSelectedItem!.name);
//               });
//             },
//           );
//         } else if (snapshot.hasError) {
//           return Text("${snapshot.error}");
//         }
//         return CircularProgressIndicator();
//       },
//     );
//   }
// }
