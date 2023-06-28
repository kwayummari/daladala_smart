import 'package:daladala_smart/src/widgets/app_image_network.dart';
import 'package:daladala_smart/src/widgets/app_rich_text.dart';
import 'package:daladala_smart/src/widgets/app_text.dart';
import 'package:flutter/material.dart';

class PatientResultsCard extends StatefulWidget {
  final String busNumber;
  final String driverName;
  final String conductorName;
  final String numberOfSeats;
  final String busType;
  final String busOwner;
  final String time;
  final String image;

  const PatientResultsCard({
    required this.busNumber,
    required this.driverName,
    required this.conductorName,
    required this.numberOfSeats,
    required this.busType,
    required this.busOwner,
    required this.time,
    required this.image,
  });

  @override
  _PatientResultsCardState createState() => _PatientResultsCardState();
}

class _PatientResultsCardState extends State<PatientResultsCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return widget.image == 'image - Medical'
        ? AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            height: isExpanded ? 250 : 70,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
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
                      IconButton(
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
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: isExpanded ? 1.0 : 0.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        richText(
                          header: 'Plate Number: ',
                          trailer: '${widget.busNumber}',
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
            height: isExpanded ? 220 : 60,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
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
                      AppText(
                        txt: 'Owner: ${widget.busOwner}',
                        size: 20,
                        weight: FontWeight.bold,
                      ),
                      IconButton(
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
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: isExpanded ? 1.0 : 0.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        richText(
                          header: 'Bus Driver: ',
                          trailer:
                              '${widget.driverName}',
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
