import 'package:daladala_smart/utils/widgets/text/text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class AppDrawer extends StatefulWidget {
  var language;
  var status;
  var username;
  AppDrawer(
      {Key? key,
      required this.language,
      required this.status,
      required this.username});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  Future<void> phonecall() async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: '0762996305',
    );
    await launchUrl(launchUri);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 3;
    return Drawer(
      backgroundColor: HexColor('#ffffff'),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                color: Colors.white,
                child: Image.asset(
                  'assets/full_logo.png',
                  height: 300,
                )),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              leading: Icon(
                Icons.person_2,
                color: Colors.black,
              ),
              title: AppText(
                txt: widget.username!,
                size: 15,
                color: HexColor('#000000'),
                weight: FontWeight.w500,
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              leading: Icon(
                Icons.newspaper,
                color: Colors.black,
                size: 15,
              ),
              title: AppText(
                txt: widget.status!,
                size: 15,
                color: HexColor('#000000'),
                weight: FontWeight.w500,
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              onTap: () => null,
              leading: Icon(
                Icons.account_box,
                color: Colors.black,
                size: 15,
              ),
              title: AppText(
                txt: 'Feedback',
                size: 15,
                color: HexColor('#000000'),
                weight: FontWeight.w500,
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              onTap: () => null,
              leading: Icon(
                Icons.meeting_room,
                color: Colors.black,
                size: 15,
              ),
              title: AppText(
                txt: 'Appointment',
                size: 15,
                color: HexColor('#000000'),
                weight: FontWeight.w500,
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              onTap: () => null,
              leading: Icon(
                Icons.meeting_room,
                color: Colors.black,
                size: 15,
              ),
              title: AppText(
                txt: 'Post Procedures Results',
                size: 15,
                color: HexColor('#000000'),
                weight: FontWeight.w500,
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              onTap: () => phonecall(),
              leading: Icon(
                Icons.phone,
                color: Colors.black,
                size: 15,
              ),
              title: AppText(
                txt: 'Contact us',
                size: 15,
                color: HexColor('#000000'),
                weight: FontWeight.w500,
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              onTap: () => null,
              leading: Icon(
                Icons.language,
                color: Colors.black,
                size: 15,
              ),
              title: AppText(
                txt: 'Kiswahili',
                size: 15,
                color: HexColor('#000000'),
                weight: FontWeight.w500,
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              onTap: () => null,
              leading: Icon(
                Icons.home,
                color: Colors.black,
                size: 15,
              ),
              title: AppText(
                txt: 'Home',
                size: 15,
                color: HexColor('#000000'),
                weight: FontWeight.w500,
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              onTap: () => null,
              leading: Icon(
                Icons.settings,
                color: Colors.black,
                size: 15,
              ),
              title: AppText(
                txt: 'Settings',
                size: 15,
                color: HexColor('#000000'),
                weight: FontWeight.w500,
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              onTap: () => null,
              leading: Icon(
                Icons.logout,
                color: Colors.black,
                size: 15,
              ),
              title: AppText(
                txt: 'Sign Out!',
                size: 15,
                color: HexColor('#000000'),
                weight: FontWeight.w500,
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
