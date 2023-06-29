import 'package:daladala_smart/src/functions/splash.dart';
import 'package:daladala_smart/src/utils/app_const.dart';
import 'package:daladala_smart/src/widgets/app_image_network.dart';
import 'package:daladala_smart/src/widgets/app_rich_text.dart';
import 'package:daladala_smart/src/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class busCard extends StatefulWidget {
  final String busNumber;
  final String driverName;
  final String conductorName;
  final String numberOfSeats;
  final String busType;
  final String busOwner;
  final String time;
  final String date;
  final String image;

  const busCard({
    required this.busNumber,
    required this.driverName,
    required this.conductorName,
    required this.numberOfSeats,
    required this.busType,
    required this.busOwner,
    required this.time,
    required this.date,
    required this.image,
  });

  @override
  _busCardState createState() => _busCardState();
}

class _busCardState extends State<busCard> {
  bool isExpanded = false;
  @override
  void initState() {
    super.initState();
    getId();
  }

  var id;
  var email;
  Future<void> getId() async {
    final SplashFunction _splashService = await SplashFunction();
    final String ids = await _splashService.getId();
    final String emails = await _splashService.getEmail();
    setState(() {
      id = ids;
      email = emails;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: isExpanded ? 220 : 60,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppConst.primary,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                appNetworkImage(endPoint: 'bus/images/${widget.image}'),
                AppText(
                  txt: 'Bus Number: ${widget.busNumber}',
                  size: 20,
                  weight: FontWeight.bold,
                  color: AppConst.white,
                ),
                IconButton(
                  color: AppConst.white,
                  icon: isExpanded
                      ? const Icon(Icons.keyboard_arrow_up)
                      : const Icon(Icons.keyboard_arrow_down),
                  onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                ),
              ],
            ),
            AppText(
              txt: 'Date: ${widget.date}',
              size: 15,
              weight: FontWeight.bold,
              color: AppConst.white,
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: isExpanded ? 1.0 : 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  richText(
                    header: 'Bus Driver: ',
                    trailer: '${widget.driverName}',
                  )
                ],
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: isExpanded ? 1.0 : 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  richText(
                    header: 'Driver\'s Name: ',
                    trailer: '${widget.driverName}',
                  )
                ],
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: isExpanded ? 1.0 : 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  richText(
                    header: 'Conductor\'s Name: ',
                    trailer: '${widget.conductorName}',
                  )
                ],
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: isExpanded ? 1.0 : 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  richText(
                    header: 'Bus Owner: ',
                    trailer: '${widget.driverName}',
                  )
                ],
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: isExpanded ? 1.0 : 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  richText(
                    header: 'Number of Seats: ',
                    trailer: '${widget.numberOfSeats}',
                  )
                ],
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: isExpanded ? 1.0 : 0.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  richText(
                    header: 'Bus Type: ',
                    trailer: '${widget.busType}',
                  )
                ],
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: isExpanded ? 1.0 : 0.0,
              child: QrImageView(
                data: email,
                version: QrVersions.auto,
                size: 50.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
