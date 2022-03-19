import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/utils/app_colors.dart';
import 'package:food/widgets/app_small_text.dart';

class AppIconText extends StatefulWidget {
  AppIconText(
      {Key? key,
      required this.text,
      required this.iconData,
      this.sizeIcon = 18,
      this.sizeText = 15,
      this.colorIcon = Colors.green,
      this.colorText = Colors.green})
      : super(key: key);

  String text;
  IconData iconData;
  double sizeText, sizeIcon;
  Color colorText, colorIcon;

  @override
  State<AppIconText> createState() => _AppIconTextState();
}

class _AppIconTextState extends State<AppIconText> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          widget.iconData,
          size: widget.sizeIcon,
          color: widget.colorIcon,
        ),
        const SizedBox(
          width: 5,
        ),
        AppSmallText(
          text: widget.text,
          color: widget.colorText,
          size: widget.sizeText,
        ),
      ],
    );
  }
}
