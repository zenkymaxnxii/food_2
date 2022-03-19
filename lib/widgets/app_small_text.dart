import 'package:flutter/material.dart';

class AppSmallText extends StatefulWidget {
  AppSmallText({
    Key? key,
    required this.text,
    this.size = 15,
    this.color = Colors.black26
  }) : super(key: key);
  String text;
  Color color;
  double size;
  @override
  State<AppSmallText> createState() => _AppSmallTextState();
}

class _AppSmallTextState extends State<AppSmallText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text,
      style: TextStyle(
        fontSize: widget.size,
        color: widget.color,
      ),
    );
  }
}
