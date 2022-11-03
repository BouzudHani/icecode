import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Widget child;
  VoidCallback? onPressed;
  Color? color ;
  Size? size ;
  CustomButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.color,
    this.size
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: size,
        backgroundColor: color,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      onPressed: onPressed,
      child: child ,
    );
  }
}
