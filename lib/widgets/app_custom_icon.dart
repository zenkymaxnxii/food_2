import 'package:flutter/material.dart';

class AppCustomIcon extends StatefulWidget {
  AppCustomIcon(
      {Key? key,
      required this.iconData,
      this.padding = 0.0,
      this.colorIcon = Colors.black,
      this.backgroundColor = const Color(0xFFfeedba),
      this.height = 40,
      this.width = 40,
      this.iconSize = 20,
      this.radius = 20})
      : super(key: key);
  IconData iconData;
  double padding;
  Color colorIcon;
  Color backgroundColor;
  double height;
  double width;
  double iconSize;
  double radius;
  @override
  State<AppCustomIcon> createState() => _AppCustomIconState();
}

class _AppCustomIconState extends State<AppCustomIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      padding: EdgeInsets.only(left: widget.padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius),
        color: widget.backgroundColor,
      ),
      child: Icon(
        widget.iconData,
        size: widget.iconSize,
        color: widget.colorIcon,
      ),
    );
  }
}
