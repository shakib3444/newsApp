import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.name,
    required this.onClick,
    this.bgColor = Colors.brown,
    this.height = 45,
    this.width = 200,
    this.textColor = Colors.white,
    this.isLoading = false,
  });
  final String name;
  final VoidCallback onClick;
  final Color? bgColor;
  final double? height;
  final double? width;
  final Color? textColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: bgColor,
        ),
        child: Center(
            child: isLoading
                ? const CircularProgressIndicator.adaptive()
                : Text(
                    name,
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        color: textColor),
                  )),
      ),
    );
  }
}
