import 'package:daladala_smart/routes/route-names.dart';
import 'package:daladala_smart/src/utils/app_const.dart';
import 'package:daladala_smart/src/widgets/app-dropdown.dart';
import 'package:daladala_smart/src/widgets/app_base_screen.dart';
import 'package:daladala_smart/src/widgets/app_button.dart';
import 'package:daladala_smart/src/widgets/app_input_text.dart';
import 'package:daladala_smart/src/widgets/app_text.dart';
import 'package:flutter/material.dart';

class navigation extends StatefulWidget {
  const navigation({super.key});

  @override
  State<navigation> createState() => _navigationState();
}

class _navigationState extends State<navigation> {
  TextEditingController destination = TextEditingController();
  TextEditingController origin = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AppBaseScreen(
        isvisible: true,
        backgroundImage: false,
        backgroundAuth: false,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: AppConst.white,
                    size: 25,
                  ),
                  AppText(
                    txt: 'Your route',
                    size: 25,
                    weight: FontWeight.w900,
                    color: AppConst.white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AppInputText(
              label: 'Pick Up Location',
              suffixicon: IconButton(
                  onPressed: () => null,
                  icon: Icon(
                    Icons.search,
                    color: AppConst.white,
                  )),
              textfieldcontroller: origin,
              isemail: false,
              fillcolor: AppConst.primary,
              obscure: false,
              ispassword: false,
            ),
            AppInputText(
              label: 'Destination',
              suffixicon: IconButton(
                  onPressed: () => null,
                  icon: Icon(
                    Icons.search,
                    color: AppConst.white,
                  )),
              textfieldcontroller: destination,
              isemail: false,
              fillcolor: AppConst.primary,
              obscure: false,
              ispassword: false,
            ),
            SizedBox(
              height: 20,
            ),
            DropdownTextFormField(apiUrl: 'destination/get.php', displayField: 'name', labelText: 'Destination', valueField: 'id',),
            SizedBox(height: 20,),
            Container(
              width: 330,
              height: 50,
              child: AppButton(
                  onPress: () =>
                      Navigator.pushNamed(context, RouteNames.pricing),
                  label: 'Submit',
                  borderRadius: 20,
                  textColor: AppConst.white,
                  bcolor: AppConst.primary),
            )
          ],
        ));
  }
}
