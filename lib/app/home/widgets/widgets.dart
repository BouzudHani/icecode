import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:games/app/home/controller/home_controller.dart';
import 'package:games/app/home/widgets/buttons.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  bool isByName;
  VoidCallback? sortBy;
  VoidCallback? changeLocale;
  String local;
  CustomAppBar({
    Key? key,
    required this.isByName,
    this.sortBy,
    this.changeLocale,
    required this.local,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              color: Colors.blueGrey,
              onPressed: changeLocale,
              child: Text(
                local,
                style: TextStyle(color: Colors.white ,fontWeight: FontWeight.w600, fontSize: 16.sp),
              ),
            ),
            CustomButton(
              onPressed: sortBy,
              color: Colors.blueGrey,
              child: Icon(
                isByName ? Icons.list_outlined : Icons.calendar_month,
                size: 20.sp,
                color: Colors.white,
              ),
            ),

          ],
        ));
  }
}

class GameCard extends GetView<HomeController> {
  String title;
  String? desc;
  String date;
  String time;
  String? imagePath;
  String playerCount;

  GameCard({
    Key? key,
    required this.title,
    required this.date,
    required this.time,
    this.imagePath,
    this.desc,
    required this.playerCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.35.sh,
      width: 1.sw,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        boxShadow: [BoxShadow(
          color: Colors.blueGrey,
          blurRadius: 5,
          offset: Offset(1,2)
        )],
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            height: 0.35.sh,
            width: 0.3.sw,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft:Radius.circular(20) )
            ),
              child: imagePath == null || imagePath == '' ?
                  Icon(Icons.image , color: Colors.black26, size: 80.sp,)
                  : ClipRRect(
                    borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20),topLeft: Radius.circular(20)),
                    child: Image.file(File(imagePath!),fit: BoxFit.cover,))
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title , style: TextStyle(color: Colors.black , fontWeight: FontWeight.w600, fontSize: 22.sp , ),),
                      InkWell(
                        onTap: ()=> controller.invite(title),
                        child: Icon(Icons.share , color: Colors.green,size: 25.sp,),
                      )
                    ],
                  ).paddingSymmetric(horizontal: 10.w),
                  SizedBox(height: 10.h,),
                  Text(desc??'' , style: TextStyle(color: Colors.black , fontSize: 12.sp),).paddingSymmetric(horizontal: 8.w),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Icon(Icons.date_range , color: Colors.blueGrey , size: 25.sp,),
                      Text(date , style: TextStyle(color: Colors.black , fontWeight: FontWeight.w600, fontSize: 16.sp , ))
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    children: [
                      Icon(Icons.timer , color: Colors.blueGrey , size: 25.sp,),
                      Text(time , style: TextStyle(color: Colors.black , fontWeight: FontWeight.w600, fontSize: 14.sp , )),
                      SizedBox(width: 8.w,),
                      Text('player'.tr , style: TextStyle(color: Colors.black , fontWeight: FontWeight.w600, fontSize: 14.sp ,), ),
                      Text(playerCount , style: TextStyle(color: Colors.black , fontWeight: FontWeight.w600, fontSize: 14.sp ,), ),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15.w),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.green
                    ),
                    child: InkWell(
                      onTap: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.map_outlined , color: Colors.white , size: 25.sp,),
                          Text('localisation'.tr , style: TextStyle(color: Colors.white , fontWeight: FontWeight.w600, fontSize: 16.sp , ))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                          size : Size(0.2.sw , 0.05.sh),
                          color: Colors.green,
                          onPressed: () => controller.goToEdit(title),
                          child: Text('edit'.tr , style: TextStyle(color: Colors.white , fontSize: 16.sp , fontWeight: FontWeight.w600),)
                      ),
                      SizedBox(width: 10.w,),
                      CustomButton(
                          size : Size(0.2.sw , 0.05.sh),
                          color: Colors.red,
                          onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text('delete'.tr),
                              content: Text('desc_del'.tr),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Get.back(),
                                  child: Text('no'.tr),
                                ),
                                TextButton(
                                  onPressed: () => controller.delete(title),
                                  child: Text('yes'.tr),
                                ),
                              ],
                            ),
                          ),
                          child: Text('delete'.tr , style: TextStyle(color: Colors.white , fontSize: 16.sp , fontWeight: FontWeight.w600),)
                      ),
                    ],
                  )
                ],
              ), 
          ),
        
        ],
      ),
    );
  }
}

