import 'package:games/app/add_edit_game/controller/Edit_controller.dart';
import 'package:get/get.dart';


class EditBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EditController>(() => EditController());
  }
}