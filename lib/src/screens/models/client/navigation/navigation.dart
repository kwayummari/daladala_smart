import 'dart:convert';
import 'package:daladala_smart/routes/route-names.dart';
import 'package:daladala_smart/src/utils/app_const.dart';
import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:daladala_smart/src/widgets/app_button.dart';
import 'package:daladala_smart/src/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:http/http.dart' as http;

class navigation extends StatefulWidget {
  const navigation({super.key});

  @override
  State<navigation> createState() => _navigationState();
}

class _navigationState extends State<navigation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdiscipline();
  }

  var destination;
  List destinations = [];
  Future getdiscipline() async {
    http.Response response;
    const API_URL = 'https://daladalasmart.com/api/destination/get.php';
    response = await http.get(Uri.parse(API_URL));
    if (response.statusCode == 200) {
      if (mounted)
        setState(() {
          destinations = json.decode(response.body);
        });
    }
  }

  List directions = [];
  var direction;
  var direction_id;

  var route;
  List routes = [];
  Future getroutes() async {
    http.Response response;
    const API_URL = 'https://daladalasmart.com/api/routes/get-byid.php';
    response = await http
        .post(Uri.parse(API_URL), body: {'id': destination.toString()});
    if (response.statusCode == 200) {
      if (mounted)
        setState(() {
          routes = json.decode(response.body);
        });
    }
  }

  TextEditingController destin = TextEditingController();
  TextEditingController dire = TextEditingController();
  TextEditingController routing = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        isvisible: true,
        backgroundImage: false,
        backgroundAuth: false,
        child: Column(
          children: [
            SizedBox(
              height: 80,
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: AppConst.white,
                    size: 25,
                  ),
                  AppText(
                    txt: 'Your route',
                    size: 25,
                    weight: FontWeight.w900,
                    color: AppConst.white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
              child: Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    color: AppConst.primary,
                    border: Border.all(color: AppConst.black, width: 1),
                    borderRadius: BorderRadius.circular(20)),
                child: TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: destin,
                    decoration: InputDecoration(
                      hintText: 'Destination',
                      hintStyle: TextStyle(color: AppConst.white, fontSize: 15),
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                    style: TextStyle(color: AppConst.white, fontSize: 15),
                  ),
                  suggestionsCallback: (String pattern) async {
                    // You can replace this with your own logic to fetch suggestions
                    return destinations.where((destination) =>
                        destination['name']
                            .toLowerCase()
                            .contains(pattern.toLowerCase()));
                  },
                  itemBuilder: (BuildContext context, dynamic suggestion) {
                    return ListTile(
                      title: AppText(
                        txt: suggestion['name'],
                        size: 15,
                        color: AppConst.primary,
                      ),
                    );
                  },
                  onSuggestionSelected: (dynamic suggestion) {
                    setState(() {
                      destin.text = suggestion['name'];
                      List d = destin.text.toString().split('-');
                      directions = d
                          .map((item) => {
                                'name': item,
                              })
                          .toList();
                      destination = suggestion['id'];
                    });
                    getroutes();
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  noItemsFoundBuilder: (BuildContext context) {
                    return AppText(
                      txt: 'No matching locations found.',
                      size: 15,
                      color: AppConst.black,
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
              child: Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    color: AppConst.primary,
                    border: Border.all(color: AppConst.black, width: 1),
                    borderRadius: BorderRadius.circular(20)),
                child: TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: dire,
                    decoration: InputDecoration(
                      hintText: 'Direction',
                      hintStyle: TextStyle(color: AppConst.white, fontSize: 15),
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                    style: TextStyle(color: AppConst.white, fontSize: 15),
                  ),
                  suggestionsCallback: (String pattern) async {
                    // You can replace this with your own logic to fetch suggestions
                    return directions.where((destination) => destination['name']
                        .toLowerCase()
                        .contains(pattern.toLowerCase()));
                  },
                  itemBuilder: (BuildContext context, dynamic suggestion) {
                    return ListTile(
                      title: AppText(
                        txt: "To ${suggestion['name']}",
                        size: 15,
                        color: AppConst.primary,
                      ),
                    );
                  },
                  onSuggestionSelected: (dynamic suggestion) {
                    setState(() {
                      dire.text = suggestion['name'];
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  noItemsFoundBuilder: (BuildContext context) {
                    return AppText(
                      txt: 'No matching locations found.',
                      size: 15,
                      color: AppConst.black,
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
              child: Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(
                    color: AppConst.primary,
                    border: Border.all(color: AppConst.black, width: 1),
                    borderRadius: BorderRadius.circular(20)),
                child: TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: routing,
                    decoration: InputDecoration(
                      hintText: 'Route',
                      hintStyle: TextStyle(color: AppConst.white, fontSize: 15),
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                    ),
                    style: TextStyle(color: AppConst.white, fontSize: 15),
                  ),
                  suggestionsCallback: (String pattern) async {
                    // You can replace this with your own logic to fetch suggestions
                    return routes.where((destination) => destination['name']
                        .toLowerCase()
                        .contains(pattern.toLowerCase()));
                  },
                  itemBuilder: (BuildContext context, dynamic suggestion) {
                    return ListTile(
                      title: AppText(
                        txt: suggestion['name'],
                        size: 15,
                        color: AppConst.primary,
                      ),
                    );
                  },
                  onSuggestionSelected: (dynamic suggestion) {
                    setState(() {
                      routing.text = suggestion['name'];
                      route = suggestion['id'];
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "This field cannot be empty";
                    } else {
                      return null;
                    }
                  },
                  noItemsFoundBuilder: (BuildContext context) {
                    return AppText(
                      txt: 'No matching locations found.',
                      size: 15,
                      color: AppConst.black,
                    );
                  },
                ),
              ),
            ),
            Container(
              width: 330,
              height: 45,
              child: AppButton(
                  onPress: () => Navigator.pushNamed(
                            context,
                            RouteNames.searchBus,
                            arguments: {
                              'destination': destination.toString(),
                              'dire': dire.text.toString(),
                              'route': route.toString(),
                            },
                          ),
                      // Navigator.pushNamed(context, RouteNames.searchBus),
                  label: 'Submit',
                  borderRadius: 20,
                  textColor: AppConst.white,
                  bcolor: AppConst.primary),
            )
          ],
        ));
  }
}
