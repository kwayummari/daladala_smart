import 'package:daladala_smart/src/utils/app_const.dart';
import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:daladala_smart/src/widgets/app_datePicker.dart';
import 'package:daladala_smart/src/widgets/app_text.dart';
import 'package:flutter/material.dart';

class bookBus extends StatefulWidget {
  var id;

  bookBus({Key? key, required this.id}) : super(key: key);

  @override
  State<bookBus> createState() => _bookBusState();
}

class _bookBusState extends State<bookBus> {
  var datePickup;

  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: CircleAvatar(
                backgroundColor: AppConst.primary,
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            AppText(
              txt:
                  'We kindly request that you take a moment to fill out our comprehensive '
                  'booking form to secure your appointment and ensure that we can provide you '
                  'with the highest quality service possible.',
              size: 15,
              color: AppConst.white,
              weight: FontWeight.w900,
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
                child: AppText(
              txt: 'Select a pickup date',
              size: 15,
              color: AppConst.white,
            )),
            SizedBox(height: 10,),
            CustomizableDatePicker(
              title: 'Select a pickup date',
              onDateSelected: (date) {
                setState(() {
                  datePickup = date;
                });
              },
              backgroundColor: AppConst.white,
              buttonColor: AppConst.primary,
              selectedColor: AppConst.primary,
              todayColor: AppConst.primary,
              textColor: AppConst.black,
            ),
            SizedBox(height: 20,),
            Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  txt: 'Select a pickup date',
                  size: 15,
                  color: AppConst.white,
                )),
            SizedBox(height: 10,),
          ],
        ),
        isvisible: false,
        backgroundImage: false,
        backgroundAuth: false);
  }
}
