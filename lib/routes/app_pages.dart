import 'package:games/app/add_edit_game/view/Edit_game_view.dart';
import 'package:games/app/home/binding/home_binding.dart';
import 'package:games/app/home/view/home_view.dart';
import 'package:games/routes/app_routes.dart';
import 'package:get/get.dart';
import '../app/add_edit_game/binding/add_binding.dart';
import '../app/add_edit_game/binding/edit_binding.dart';
import '../app/add_edit_game/view/add_game_view.dart';

class AppPages{
  AppPages._();
  static const INITPAGE = Routes.HOME_PAGE;

  static final routes = [
    GetPage(
      name: Paths.HOME,
      page: ()=> const HomeView(),
      binding: HomeBinding()
    ),
    GetPage(
      name: Paths.ADD,
      page: ()=> const AddGameView(),
      binding: AddBinding()
    ),
    GetPage(
        name: Paths.EDIT,
        page: ()=> const EditGameView(),
        binding: EditBinding()
    )
  ];

}