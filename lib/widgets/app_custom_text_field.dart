import 'package:flutter/material.dart';

class AppCustomTextField extends StatefulWidget {
  AppCustomTextField(
      {Key? key,
      required this.textEditingController,
      required this.hintText,
      required this.iconData,
      this.color = const Color(0xFF89dad0),
      this.password = false,})
      : super(key: key);
  IconData iconData;
  String hintText;
  Color color;
  bool password;
  TextEditingController textEditingController;
  @override
  State<AppCustomTextField> createState() => _AppCustomTextFieldState();
}

class _AppCustomTextFieldState extends State<AppCustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 15,left: 20,right: 20,bottom: 15),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(-10, 10),
              blurRadius: 10,
              color: Colors.grey.withOpacity(0.25),
            ),
            BoxShadow(
              offset: const Offset(10, -10),
              blurRadius: 10,
              color: Colors.grey.withOpacity(0.25),
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: TextField(
          controller: widget.textEditingController,
          obscureText: widget.password,
          decoration: InputDecoration(
            hintText: widget.hintText,
            prefixIcon: Icon(
              widget.iconData,
              color: widget.color,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  width: 1.0,
                  color: Colors.white,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(
                  width: 1.0,
                  color: Colors.white,
                )),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ));
  }
}
