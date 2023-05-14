import 'package:daladala_smart/src/service/booking-service.dart';
import 'package:daladala_smart/src/utils/app_const.dart';
import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:daladala_smart/src/widgets/app_datePicker.dart';
import 'package:daladala_smart/src/widgets/app_text.dart';
import 'package:daladala_smart/src/widgets/app_timePicker.dart';
import 'package:flutter/material.dart';

class bookBus extends StatefulWidget {
  var id;
  var seats;
  bookBus({Key? key, required this.id, required this.seats}) : super(key: key);

  @override
  State<bookBus> createState() => _bookBusState();
}

class _bookBusState extends State<bookBus> {
  var datePickup = DateTime.now();
  var timePickup = TimeOfDay.now();
  @override
  void initState() {
    super.initState();
    getBusesHours();
  }
  var numbers;
  bool isBookable = false;
  Future<String> getBusesHours() async {
    final bookingService _bookingService = await bookingService();
     var bookingnumbers =
    await _bookingService.getbookings(context, datePickup.toString(), timePickup.toString());
     int seatsLeft = int.parse(widget.seats) - int.parse(bookingnumbers.toString());
     if(seatsLeft > 0) {
       setState(() {
         isBookable = true;
       });
     } else {
       isBookable = false;
     }
    return bookingnumbers.toString();
  }
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
            SizedBox(
              height: 10,
            ),
            CustomizableDatePicker(
              title: 'Select a pickup date',
              onDateSelected: (date) {
                print(date);
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
            SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: AppText(
                  txt: 'Select a pickup time',
                  size: 15,
                  color: AppConst.white,
                )),
            SizedBox(
              height: 10,
            ),
            CustomizableTimePicker(
                backgroundColor: AppConst.white,
                buttonColor: AppConst.primary,
                selectedColor: AppConst.primary,
                todayColor: AppConst.primary,
                textColor: AppConst.black,
                title: 'Select a pickup time',
                onTimeSelected: (time) {
                  print(time);
                  setState(() {
                    timePickup = time;
                  });
                }),
            SizedBox(height: 20,),
            if(isBookable)
              Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    txt: 'Select payment type',
                    size: 15,
                    color: AppConst.white,
                  )),
            if(isBookable)
              App
          ],
        ),
        isvisible: false,
        backgroundImage: false,
        backgroundAuth: false);
  }
}
