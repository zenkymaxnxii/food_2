import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/utils/app_colors.dart';
import 'package:food/widgets/app_large_text.dart';

class AppCustomButton extends StatefulWidget {
  AppCustomButton(
      {Key? key,
      required this.text,
      this.color = Colors.white,
      this.width = 120,
      this.height = 60,
      this.radius = 20,
      this.sizeText = 20,
      this.fontWeight = FontWeight.normal})
      : super(key: key);
  String text;
  Color color;
  double width;
  double height;
  double radius;
  double sizeText;
  FontWeight fontWeight;
  @override
  State<AppCustomButton> createState() => _AppCustomButtonState();
}

class _AppCustomButtonState extends State<AppCustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius),
        color: AppColors.mainColor,
      ),
      child: Center(
        child: AppLargeText(
          text: widget.text,
          size: widget.sizeText,
          color: widget.color,
          fontWeight: widget.fontWeight,
        ),
      ),
    );
  }
}
