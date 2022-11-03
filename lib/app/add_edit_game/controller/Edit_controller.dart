import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:games/app/home/controller/home_controller.dart';
import 'package:games/utilities/hive_db.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../data/games_model.dart';
import '../../../utilities/utilities.dart';

class EditController extends GetxController{
  Game g = Get.arguments as Game;

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController playerCount = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  var date = DateTime(2020,1,1,00,00).obs;
  var image = ''.obs;

  @override
  void onInit() {
    super.onInit();
    print(g.title);
    titleController.text = g.title;
    descController.text = g.description ?? '';
    playerCount.text = g.playersCount;
    image(g.imagePath);
    date(g.date);
  }

  void pickDate(BuildContext context ){
      DatePicker.showDateTimePicker(
          context,
          showTitleActions: true,
          minTime: DateTime(2020 , 1 , 1),
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

  void editGame(){
    if(titleController.text.isNotEmpty
        && date.value.year != 0
        && playerCount.text.isNotEmpty){

            g.date = date.value;
            g.imagePath = image.value;
            g.title = titleController.text;
            g.description = descController.text;
            g.playersCount = playerCount.text;

            Database.updateGame(g);
            Get.find<HomeController>().updateData();
            Get.back();
    }else{
      toastMe('title , player count and date are required');
    }

  }

}