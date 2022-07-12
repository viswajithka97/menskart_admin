// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:menskart_admin/view/core/color_constants.dart';

class ContainerConfirmButton extends StatelessWidget {
  final double height;
  final double width;
  final IconData? containerIcon;
  final String buttonText;
  final Color buttonColor;
   final BorderRadius radius ;
   final  onpressed;
  const ContainerConfirmButton({
    Key? key,
    required this.height,
    required this.width,
     this.containerIcon,
     this.buttonColor=kConButonColor,
    required this.radius,
    required this.buttonText, this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        Get.offAll( onpressed);
      },
      child: Container(
        height: height,
        width: width,
        decoration:
            BoxDecoration(color: buttonColor, borderRadius: radius),
        child:  Center(
          child: Text(
              buttonText,
              style: const TextStyle(color: kBlack, fontSize: 15),
            ),
        ),
        ),
    );
  }
}
