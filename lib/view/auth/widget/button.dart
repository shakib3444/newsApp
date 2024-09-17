import 'package:flutter/material.dart';

import '../../../utility/app_color.dart';

class Button extends StatelessWidget {
  const Button({
    super.key, required this.image, required this.onTap,
  });
  final String image;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding:const EdgeInsets.all(5),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        child:Image.asset(image,height: 30,width: 30,fit: BoxFit.cover,) ,
      ),
    );
  }
}