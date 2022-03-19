import 'package:flutter/material.dart';

class AppLargeText extends StatefulWidget {
  AppLargeText(
      {Key? key,
      required this.text,
      this.size = 20,
      this.color = Colors.black,
      this.overflow = TextOverflow.ellipsis,
      this.fontWeight = FontWeight.normal})
      : super(key: key);
  String text;
  Color color;
  double size;
  FontWeight fontWeight;
  TextOverflow overflow;
  @override
  State<AppLargeText> createState() => _AppLargeTextState();
}

class _AppLargeTextState extends State<AppLargeText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      overflow: widget.overflow,
      style: TextStyle(
        fontWeight: widget.fontWeight,
        fontSize: widget.size,
        color: widget.color,
      ),
    );
  }
}
