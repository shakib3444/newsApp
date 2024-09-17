import 'package:flutter/material.dart';

class AppInput extends StatelessWidget {
  const AppInput({super.key,
    required this.hint,
    required this.controller,
    this.textType,
  this.obscureText=false,
  this.validator, this.suffixIcon,
  });
  final String hint;
  final TextEditingController controller;
  final TextInputType? textType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;



  @override
  Widget build(BuildContext context) {
    return TextFormField(

      obscureText: obscureText,
      validator: validator,
      controller: controller,
      keyboardType:textType ,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 15),
        hintText: hint,
        hintStyle:const TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        suffixIcon:suffixIcon ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),

    );
  }
}
