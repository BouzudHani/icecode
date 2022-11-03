import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:games/data/games_model.dart';
import 'package:games/utilities/utilities.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utilities/hive_db.dart';
import '../../home/controller/home_controller.dart';

class AddController extends GetxController{
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController playerCount = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  var date = DateTime(0).obs;
  var image = ''.obs;

  @override
  void onInit() {
    super.onInit();

  }

  void pickDate(BuildContext context ){
      DatePicker.showDateTimePicker(
          context,
          showTitleActions: true,
          minTime: DateTime.now(),
          maxTime: DateTime(2030 , 1 , 1),
          onChanged: (picked){
            print(picked);
            date(picked);
          },
          onConfirm: (picked){
            date(picked);
        },
        locale: LocaleType.en,
      );
  }

  void pickImage() async {
    XFile? im = await _picker.pickImage(source: ImageSource.gallery);
    if(im != null){
      image(im.path);
    }
  }

  void addGame(){
    if(titleController.text.isNotEmpty
        && date.value.year != 0
        && playerCount.text.isNotEmpty){
      Game game = Game(
          title: titleController.text,
          date: date.value,
          playersCount: playerCount.text,
          description: descController.text,
          imagePath: image.value
      );
      Database.addGame(game);
      Get.find<HomeController>().updateData();
      Get.back();
    }else{
      toastMe('title , player count and date are required');
    }
  }

}