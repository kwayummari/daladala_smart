// import 'package:flutter/material.dart';
// class NavigationExample extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(32.0),
//       child: Column(
//         children: <Widget>[
//           SizedBox(
//             height: 10.0,
//           ),
//           TypeAheadField(
//             textFieldConfiguration: TextFieldConfiguration(
//               autofocus: true,
//               style: DefaultTextStyle.of(context).style.copyWith(fontStyle: FontStyle.italic),
//               decoration: InputDecoration(border: OutlineInputBorder(), hintText: 'What are you looking for?'),
//             ),
//             suggestionsCallback: (pattern) async {
//               return await BackendService.getSuggestions(pattern);
//             },
//             itemBuilder: (context, Map<String, String> suggestion) {
//               return ListTile(
//                 leading: Icon(Icons.shopping_cart),
//                 title: Text(suggestion['name']!),
//                 subtitle: Text('\$${suggestion['price']}'),
//               );
//             },
//             onSuggestionSelected: (Map<String, String> suggestion) {
//               Navigator.of(context)
//                   .push<void>(MaterialPageRoute(builder: (context) => ProductPage(product: suggestion)));
//             },
//             suggestionsBoxDecoration: SuggestionsBoxDecoration(
//               borderRadius: BorderRadius.circular(10.0),
//               elevation: 8.0,
//               color: Theme.of(context).cardColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }