import 'package:daladala_smart/src/utils/app_const.dart';
import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:flutter/material.dart';

class bookBus extends StatefulWidget {
  var id;
   bookBus({Key? key, required this.id}) : super(key: key);

  @override
  State<bookBus> createState() => _bookBusState();
}

class _bookBusState extends State<bookBus> {
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        child: Column(
          children: [
            CircleAvatar(
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
          ],
        ),
        isvisible: true,
        backgroundImage: false,
        backgroundAuth: false);
  }
}
