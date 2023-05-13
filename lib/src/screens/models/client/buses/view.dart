// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, non_constant_identifier_names, duplicate_ignore, prefer_const_constructors, body_might_complete_normally_nullable, prefer_if_null_operators, no_leading_underscores_for_local_identifiers, unused_element, avoid_print, unused_label

import 'package:daladala_smart/src/utils/animations/fadeanimation.dart';
import 'package:daladala_smart/src/utils/app_const.dart';
import 'package:daladala_smart/src/widgets/app_button.dart';
import 'package:daladala_smart/src/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class viewBusDetails extends StatefulWidget {
  var driver;
  var conductor;
  var number_of_seat;
  var bus_type;
  var owner;
  var image;
  // ignore: non_constant_identifier_names
  viewBusDetails(
      {Key? key,
        required this.driver,
        required this.conductor,
        required this.number_of_seat,
        required this.bus_type,
        required this.owner,
        required this.image,})
      : super(key: key);

  @override
  State<viewBusDetails> createState() => _viewBusDetailsState();
}

class _viewBusDetailsState extends State<viewBusDetails> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: FadeAnimation(
              1.2,
              Image.network('${murl}choices/image/${widget.image}'),
            ),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: FadeAnimation(
              1.2,
              CircleAvatar(
                backgroundColor: HexColor('#981EE4'),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: mediaQuery.size.height / 1.5,
            child: FadeAnimation(
              1.2,
              Container(
                padding: EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: HexColor('#000000')),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeAnimation(
                        1.3,
                        Center(
                          child: AppText(
                            txt: '${widget.driver}',
                            color: HexColor('#000000'),
                            size: 18,
                            weight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Divider(
                        color: HexColor('#981EE4'),
                      ),
                      FadeAnimation(
                        1.3,
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: HexColor('#981EE4'),
                              child: Icon(Icons.calendar_month,
                                  color: HexColor('#ffffff')),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            AppText(
                              txt: 'Date -${widget.conductor}',
                              color: HexColor('#000000'),
                              size: 15,
                              weight: FontWeight.w700,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FadeAnimation(
                        1.3,
                        Row(
                          children: [
                            CircleAvatar(
                                backgroundColor: HexColor('#981EE4'),
                                child: Icon(Icons.person,
                                    color: HexColor('#ffffff'))),
                            SizedBox(
                              width: 10,
                            ),
                            AppText(
                              txt: 'Author -${widget.number_of_seat}',
                              color: HexColor('#000000'),
                              size: 15,
                              weight: FontWeight.w700,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: HexColor('#981EE4'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AppText(
                        txt: 'Caption',
                        color: HexColor('#981EE4'),
                        size: 18,
                      ),
                      Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: Center(
                          child: FadeAnimation(
                            1.3,
                            AppText(
                              txt: '${widget.owner}',
                              color: HexColor('#000000'),
                              size: 18,
                              weight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      AppText(
                        txt: 'Description',
                        color: HexColor('#981EE4'),
                        size: 18,
                      ),
                      Container(
                        margin: const EdgeInsets.all(15.0),
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black)),
                        child: FadeAnimation(
                          1.4,
                          AppText(
                            txt: '${widget.bus_type}',
                            color: HexColor('#000000'),
                            weight: FontWeight.w700,
                            size: 18,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 300,
                          height: 50,
                          child: AppButton(
                              onPress: () => null,
                              label:  'Provide feedback',
                              bcolor: AppConst.primary, borderRadius: 20, textColor: AppConst.white,),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
