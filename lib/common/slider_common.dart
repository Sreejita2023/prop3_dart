import 'package:flutter/material.dart';


class SliderCommon extends StatefulWidget {
  final String head;
  final String content;
  final double initialValue;
  final int division;
  final double maxvalue;
  final double minvalue = 0;
  final int keyValue;

  // to get value
  final ValueChanged<double> onChanged;
  const SliderCommon(
      {super.key,
      required this.head,
      required this.content,
      required this.initialValue,
      required this.division,
      required this.maxvalue,
      required this.onChanged, required this.keyValue});

  @override
  State<SliderCommon> createState() => _SliderCommonState();
}

class _SliderCommonState extends State<SliderCommon> {
  String getValue(int keyValue){
     switch(keyValue){
       case 1:
         return "${widget.initialValue}";
       case 2:
         return "${widget.initialValue} km";
       case 3:
         return "\u20B9 ${widget.initialValue}";
       case 4:
         return "\u20B9 ${widget.initialValue}/km";
       case 5:
         return'${widget.initialValue.toInt()}';
       default:
         return '';
     }
  }

  @override
  Widget build(BuildContext context) {

    return Center(
      // padding: const EdgeInsets.only(left: 8.0,right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.head,
          ),
          Text(
            widget.content,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Slider(
                value: widget.initialValue,
                max: widget.maxvalue,
                divisions: widget.division,
                onChanged: widget.onChanged,
              ),),
              Text(getValue(widget.keyValue))
            ],
          )
        ],
      ),
    );
  }
}


