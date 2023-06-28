// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, curly_braces_in_flow_control_structures, depend_on_referenced_packages, library_private_types_in_public_api, import_of_legacy_library_into_null_safe
import 'package:daladala_smart/src/screens/models/driver/profile/profile.dart';
import 'package:daladala_smart/src/screens/models/driver/rides/rides.dart';
import 'package:daladala_smart/src/utils/app_const.dart';
import 'package:flutter/material.dart';

class bottomNavigationDriver extends StatefulWidget {
  const bottomNavigationDriver({Key? key}) : super(key: key);

  @override
  _bottomNavigationDriverState createState() => _bottomNavigationDriverState();
}

class _bottomNavigationDriverState extends State<bottomNavigationDriver> {
  int index = 0;
  final Screen = [
    rides(),
    profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            body: Screen[index],
            extendBody: true,
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: AppConst.black,
                primaryColor: AppConst.black,
              ),
              child: BottomNavigationBar(
                selectedItemColor: AppConst.primary,
                unselectedItemColor: AppConst.grey,
                backgroundColor: AppConst.black,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.car_rental), label: 'My Rides'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person_search_sharp), label: 'Profile'),
                ],
                currentIndex: index,
                onTap: (index) {
                  if (mounted) setState(() => this.index = index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
