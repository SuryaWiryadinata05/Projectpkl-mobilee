import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:project/app/core/utils/extension.dart';
import 'package:project/app/controller/controller.dart';

// class Search extends StatefulWidget {
//   final homeCtrl = Get.find<HomeController>();
//   final Task task;
//   Search({Key? key, required this.task}) : super(key: key);

//   @override
//   State<Search> createState() => _SearchState();
// }

// class _SearchState extends State<Search> {
//   @override
//   Widget build(BuildContext context) {

//   }
// }
class Search extends StatefulWidget {
  Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final homeCtrl = Get.find<HomeController>();

  // List<String> data = [
  //   'Motor',
  //   'dtaa',
  //   'apaa',
  //   'sok',
  //   'hehe',
  //   'Mobil',
  // ];

  // Future SearchData(String param) async {
  //   List<String> result =
  //       data.where((element) => element.contains(param)).toList();
  //   return result;
  // }

  // @override
  // void initState() {
  //   super.initState();
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        // TypeAheadField(
        //   textFieldConfiguration: TextFieldConfiguration(
        //       autofocus: true,
        //       style: DefaultTextStyle.of(context)
        //           .style
        //           .copyWith(fontStyle: FontStyle.italic),
        //       decoration: InputDecoration(border: OutlineInputBorder())),
        //   suggestionsCallback: (pattern) async {

        //     return await SearchData(pattern);
        //   },
        //   itemBuilder: (context, suggestion) {
        //     return ListTile(
        //       leading: Icon(Icons.shopping_cart),
        //       title: Text(suggestion.toString()),
        //     );
        //   },
        //   onSuggestionSelected: (suggestion) {
        //     print(suggestion);
        //   },
        // )

        Container(
          margin: EdgeInsets.all(5.0.wp),
          child: DropdownSearch(
            items: ['apasok', 'wkwkw', 'hehe'],
            selectedItem: 'apasok',
            onChanged: (value) => (value),
          ),
        )
      ]),
    );
  }
}
