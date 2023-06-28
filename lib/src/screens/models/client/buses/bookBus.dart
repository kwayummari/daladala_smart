import 'package:daladala_smart/src/service/booking-service.dart';
import 'package:daladala_smart/src/service/busHours-service.dart';
import 'package:daladala_smart/src/utils/app_const.dart';
import 'package:daladala_smart/src/widgets/app-offlineDropdownFormField.dart';
import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:daladala_smart/src/widgets/app_button.dart';
import 'package:daladala_smart/src/widgets/app_datePicker.dart';
import 'package:daladala_smart/src/widgets/app_text.dart';
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
  var timePickup = TimeOfDay.now().toString();
  var paymentType;
  var seats;

  @override
  void initState() {
    super.initState();
    getBusesSeats();
    getBusesHours();
  }

  var numbers;
  bool isBookable = false;
  List<int> numberList = [];
  Future<String> getBusesSeats() async {
    final bookingService _bookingService = await bookingService();
    var bookingNumbers = await _bookingService.getbookings(context,
        datePickup.toString(), timePickup.toString(), widget.id.toString());
    int seatsLeft =
        int.parse(widget.seats) - int.parse(bookingNumbers.toString());
    if (seatsLeft > 0) {
      setState(() {
        isBookable = true;
        numbers = seatsLeft;
        numberList = List.generate(seatsLeft, (index) => index + 1);
      });
    } else {
      isBookable = false;
    }
    return bookingNumbers.toString();
  }

  List hours = [];

  Future<List> getBusesHours() async {
    final busHoursService _busesHoursService = await busHoursService();
    final List busesHoursList =
        await _busesHoursService.getBusHours(context, widget.id);
    setState(() {
      hours = busesHoursList;
    });
    print(hours);
    return busesHoursList;
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
            AppDropdownTextFormField(
                labelText: 'Select Timeline',
                options: numberList,
                value: hours[index]['timeline'],
                onChanged: (newValue) {
                  setState(() {
                    timePickup = newValue;
                  });
                },
              ),
            SizedBox(
              height: 20,
            ),
            if (isBookable)
              Align(
                  alignment: Alignment.centerLeft,
                  child: AppText(
                    txt: 'Select number of seats',
                    size: 15,
                    color: AppConst.white,
                  )),
            if (isBookable)
              SizedBox(
                height: 10,
              ),
            if (isBookable)
              AppDropdownTextFormField(
                labelText: 'Number of seats',
                options: numberList,
                value: seats,
                onChanged: (newValue) {
                  setState(() {
                    seats = newValue;
                  });
                },
              ),
            if (isBookable)
              Container(
                  height: 50,
                  width: 350,
                  child: AppButton(
                      onPress: () => bookingService().postbookings(
                          context,
                          widget.id.toString(),
                          datePickup.toString(),
                          timePickup.toString(),
                          paymentType.toString(),
                          seats.toString()),
                      label: 'Submit',
                      borderRadius: 20,
                      textColor: AppConst.white,
                      bcolor: AppConst.primary))
          ],
        ),
        isvisible: false,
        backgroundImage: false,
        backgroundAuth: false);
  }
}
