import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:games/routes/app_pages.dart';
import 'package:games/translation/translation.dart';
import 'package:games/utilities/hive_db.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/home/binding/home_binding.dart';

void main() async{
  await Hive.initFlutter();
  await Database.initDB();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      ScreenUtilInit(
        builder: (context ,child){
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              backgroundColor: Colors.white,
            ),
            translations: Messages(),
            locale: const Locale("en"),
            fallbackLocale: const Locale("en"),
            initialRoute: AppPages.INITPAGE,
            getPages: AppPages.routes,
            initialBinding: HomeBinding(),
          );
        },
      )
  );
}
