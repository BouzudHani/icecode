import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:games/app/add_edit_game/widgets/widgets.dart';
import 'package:games/app/home/widgets/buttons.dart';
import 'package:get/get.dart';

void toastMe(String content){
  Fluttertoast.showToast(
    msg: content,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.black26,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

void showCustomBottomSheet (BuildContext context , TextEditingController controller , VoidCallback? onPressed){
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return Container(
        height: 0.4.sh,
        decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20) )
          ),
        child: Center(
          child: Column(
            children: [
              CustomTextInput(
                  title: 'phone_number'.tr,
                  isNumber: true,
                  controller: controller,
                  hintText: 'exmpl : +97177665544',
              ),
              CustomButton(
                  color: Colors.green,
                  onPressed: onPressed,
                  size: Size(0.8.sw , 0.06.sh),
                  child: Text('send'.tr , style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white),)
              ),
            ],
          ),
        )
      );
    },
  );
}