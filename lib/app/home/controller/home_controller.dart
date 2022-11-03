import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:games/utilities/constante.dart';
import 'package:games/utilities/hive_db.dart';
import 'package:games/utilities/utilities.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../data/games_model.dart';
import '../../../routes/app_routes.dart';
import '../Repository/repository.dart';

class HomeController extends GetxController{
  TextEditingController phone = TextEditingController();
  var games = <Game>[].obs;
  var isByName = true.obs;
  var locale = "en".obs;

  @override
  void onInit() {
    super.onInit();
    checkLocale();
    updateData();
  }

  void updateLanguage(){
    if(locale.value == "en"){
      Database.box1!.put(AppConstant.local , "ar");
      locale("ar");
      Get.updateLocale(const Locale("ar"));
    }else{
      Database.box1!.put(AppConstant.local , "en");
      locale("en");
      Get.updateLocale(const Locale("en"));
    }
  }

  void updateData(){
    if(isByName.value){
      games(Database.sortByName());
    }else{
      games(Database.sortByDate());
    }
  }

  void delete(String title){
    Game? game = games.firstWhere((element) => element.title == title );
    print(game.key);
    print(game.title);
    game.delete();
    updateData();
    Get.back();
  }

  void changeSortBy(){
    isByName(!isByName.value);
    if(isByName.isTrue){
      games(Database.sortByName());
    }else{
      games(Database.sortByDate());
    }
  }

  void goToEdit(String title){
      Game g = Database.getGameByName(title);
      Get.toNamed(Paths.EDIT , arguments: g );
  }

  void checkLocale() {
      locale(Database.box1!.get(AppConstant.local));
      print(locale.value);
  }

  void inviteFriend(String title){
      if(phone.text.isNotEmpty && phone.text.isPhoneNumber){
        Game g = Database.getGameByName(title);
        String inviteMessage = 'You are Invited to Play ${g.title} on ${g.date.year}-${g.date.month}-${g.date.day} at ${g.date.hour}:${g.date.day} with ${g.playersCount} players' ;
        TwilioRepo.send();
        TwilioRepo.sendMessage(phone.text , inviteMessage).then((value) => {
          if(value){
              Get.back()
          }
        });
      }else{
        toastMe('Phone Number Incorrect');
      }
  }

  void invite(String title){
    Game g = Database.getGameByName(title);
    String inviteMessage = 'You are Invited to Play ${g.title} on ${g.date.year}-${g.date.month}-${g.date.day} at ${g.date.hour}:${g.date.day} with ${g.playersCount} players' ;
    Share.share(inviteMessage);
  }

  Future<void> onRefrech() async {
    updateData();
  }
}