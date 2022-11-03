import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:games/app/home/widgets/buttons.dart';
import 'package:get/get.dart';
import '../controller/add_controller.dart';
import '../widgets/widgets.dart';

class AddGameView extends GetView<AddController> {
  const AddGameView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        title: Text('add_game'.tr , style: const TextStyle(color: Colors.black,),),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextInput(title: 'title'.tr,controller: controller.titleController,),
              CustomTextInput(title: 'desc'.tr,minLine: 4,maxlenght: true,controller: controller.descController,),
              CustomTextInput(title: 'max'.tr,controller: controller.playerCount,isNumber: true),
              Obx(() => CustomDateInput(
                title: 'date_time'.tr,
                time: controller.date.value.toString(),
                onPressed: () => controller.pickDate(context),
              )),
              Obx(() => CustomImagePicker(
                title: 'image'.tr ,
                image: controller.image.value == ''
                    ? Icon(Icons.image, size: 80.sp, color: Colors.grey,)
                    : ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image.file(File(controller.image.value), fit: BoxFit.cover,)),
                onPressed: ()=> controller.pickImage(),
              )),
              SizedBox(height: 10.h,),
              CustomButton(
                  color: Colors.blueGrey,
                  onPressed: () => controller.addGame(),
                  size: Size(1.sw ,0.06.sh),
                  child: Text('add_game'.tr),
              )
            ],
          ).paddingSymmetric(horizontal: 15.h , vertical: 10),
        ),

      ),
    );
  }
}
