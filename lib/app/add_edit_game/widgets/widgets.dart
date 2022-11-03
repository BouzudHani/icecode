import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextInput extends StatelessWidget {
  String title;
  String? hintText ;
  int? minLine;
  bool maxlenght;
  bool isNumber;
  TextEditingController? controller;
  CustomTextInput({
    Key? key,
    required this.title,
    this.hintText,
    this.minLine,
    this.maxlenght = false,
    this.controller,
    this.isNumber = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title , style: TextStyle(color: Colors.black , fontSize: 18.sp , fontWeight: FontWeight.w600),),
        SizedBox(height: 10.h,),
        maxlenght ? TextFormField(
            controller: controller,
             minLines: minLine ?? 1,
             maxLines:10,
             maxLength: 300,
             decoration:InputDecoration(
               hintText: hintText ?? '',
               border: const OutlineInputBorder(
                 borderRadius: BorderRadius.all(Radius.circular(10)),
               )
             ),
        )
            : TextFormField(
              controller: controller,
              minLines: minLine ?? 1,
              keyboardType: isNumber ? TextInputType.phone : TextInputType.text,
              decoration:InputDecoration(
                  hintText: hintText ?? '',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  )
              ),
            ),
        SizedBox(height: 10.h,),
      ],
    );
  }
}

class CustomDateInput extends StatelessWidget {
  String title;
  String? hintText ;
  GestureTapCallback? onPressed;
  String? time;
  CustomDateInput({
    Key? key,
    required this.title,
    this.hintText,
    this.onPressed,
    this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title , style: TextStyle(color: Colors.black , fontSize: 18.sp , fontWeight: FontWeight.w600),),
        SizedBox(height: 10.h,),
        Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.black45 , width: 1)
          ),
          child: Row(
            children: [
              SizedBox(width: 10.w,),
              Expanded(child: Text(time ?? '')),
              Container(
                width: 0.15.sw,
                height: 0.07.sh,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.blueGrey
                ),
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  onTap: onPressed,
                  child: Icon(
                  Icons.calendar_month,
                  color: Colors.white,
                  size: 20.sp,
                ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 10.h,),
      ],
    );
  }
}

class CustomImagePicker extends StatelessWidget {
  String title;
  GestureTapCallback? onPressed;
  Widget image;
  CustomImagePicker({
    Key? key,
    required this.title,
    this.onPressed,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title , style: TextStyle(color: Colors.black , fontSize: 18.sp , fontWeight: FontWeight.w600),),
        SizedBox(height: 10.h,),
        Container(
          height: 0.2.sh,
          width: 1.sw,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(color: Colors.black45 , width: 1)
          ),
          child: Center(
            child: InkWell(
              onTap: onPressed,
              child: image,
            ),
          ),
        ),
        SizedBox(height: 10.h,),
      ],
    );
  }
}

