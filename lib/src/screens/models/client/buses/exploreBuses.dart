import 'package:daladala_smart/src/utils/app_const.dart';
import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:daladala_smart/src/widgets/app_text.dart';
import 'package:flutter/material.dart';

class exploreBuses extends StatefulWidget {
  var id;
   exploreBuses({Key? key, required this.id}) : super(key: key);

  @override
  State<exploreBuses> createState() => _exploreBusesState();
}

class _exploreBusesState extends State<exploreBuses> {
  late Future<List> _futureBusDetailsList;
  @override
  void initState() {
    super.initState();
    _futureBusDetailsList = getBusesDetails();
  }
  Future<List> getBusesDetails() async {
    final busService _busesService = await busService();
    final List busesList = await _busesService.getBus(
        context, widget.destination, widget.dire, widget.route);
    return busesList;
  }
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        child: Container(
          child: AppText(txt: widget.id.toString(), size: 15, color: AppConst.white,),
        ),
        isvisible: false,
        backgroundImage: false,
        backgroundAuth: false,
    );
  }
}
