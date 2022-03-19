import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/utils/app_colors.dart';
import 'package:food/widgets/app_small_text.dart';

class ExpandedText extends StatefulWidget {
  ExpandedText({
    Key? key,
    required this.text,
    this.lengthText = 400,
    this.color = Colors.green,
    this.size = 15,
    this.isScroll = true,
  }) : super(key: key);
  String text;
  Color color;
  double size;
  bool isScroll;
  int lengthText;
  @override
  State<ExpandedText> createState() => _ExpandedTextState();
}

class _ExpandedTextState extends State<ExpandedText> {
  bool checkScroll = true;
  String firstHalf = '';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.text.length<=widget.lengthText){
      setState(() {
        checkScroll = false;
      });
    } else {
      firstHalf = widget.text.substring(0, widget.lengthText);
    }
  }
  @override
  Widget build(BuildContext context) {

    return SizedBox(
      child: checkScroll?Column(
        children: [
          Text(
            !widget.isScroll
                ? widget.text
                : firstHalf + "...",
            style: TextStyle(
              height: 2,
              fontSize: widget.size,
              color: widget.color,
            ),
          ),
          InkWell(
            onTap: ()=>setState(() {
              widget.isScroll=!(widget.isScroll);
            }),
            child: Row(
              children: [
                AppSmallText(
                  text: widget.isScroll ? 'Show more' : 'Show less',
                  color: AppColors.mainColor,
                ),
                const SizedBox(
                  width: 5,
                ),
                widget.isScroll
                    ? const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey,
                )
                    : const Icon(
                  Icons.arrow_drop_up,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ],
      ):Text(widget.text,
        style: TextStyle(
          height: 2,
          fontSize: widget.size,
          color: widget.color,
        ),
      ),
    );
  }
}
