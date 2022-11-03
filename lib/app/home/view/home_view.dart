import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:games/app/home/widgets/buttons.dart';
import 'package:games/routes/app_routes.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../widgets/widgets.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Obx(()=>
            CustomAppBar(
              local: controller.locale.value,
              isByName: controller.isByName.value,
              sortBy: ()=> controller.changeSortBy(),
              changeLocale: ()=> controller.updateLanguage(),
            )
        ),
      ),
      body: Center(
        child: Column(
          children: [
            CustomButton(
              onPressed: () => Get.toNamed(Paths.ADD),
                color: Colors.green,
                size: Size(1.sw , 0.05.sh),
                child: Text('add'.tr , style: TextStyle(color: Colors.white , fontSize: 20.sp , fontWeight: FontWeight.w600),),
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: const ScrollBehavior(),
                child: Obx(()=> RefreshIndicator(
                          onRefresh: ()=> controller.onRefrech(),
                          child: ListView.builder(
                              itemCount: controller.games.length,
                              itemBuilder: (context , index){
                                return GameCard(
                                  title: controller.games[index].title,
                                  date: '${controller.games[index].date.year}-${controller.games[index].date.month}-${controller.games[index].date.day}',
                                  playerCount: controller.games[index].playersCount.toString(),
                                  time: '${controller.games[index].date.hour}:${controller.games[index].date.minute}',
                                  desc: controller.games[index].description,
                                  imagePath: controller.games[index].imagePath,
                                ).paddingSymmetric(horizontal : 5.w,vertical: 10.h);
                              }),
                        )),
                      ),
                    )
                  ],

                ).paddingSymmetric(horizontal: 20.w , vertical: 15.h),
      ),
    );
  }
}
