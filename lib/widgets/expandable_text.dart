import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/utilities/colors.dart';
import 'package:food_delivery_ecommerce/utilities/dimension.dart';
import 'package:food_delivery_ecommerce/widgets/small_text.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  const ExpandableText({super.key, required this.text});

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late String firstHalfText;
  late String secondHalfText;

  bool hiddenText = true;
  double textHeight = Dimension.screenHeight / 5.47;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalfText = widget.text.substring(0, textHeight.toInt());
      secondHalfText =
          widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalfText = widget.text;
      secondHalfText = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalfText.isEmpty
          ? SmallText(text: firstHalfText, size: Dimension.font16, color: AppColors.paraColor, height: 1.5,)
          :  Column(
            children: [
              SmallText(text: hiddenText?(firstHalfText+"..."):(firstHalfText+secondHalfText), size: Dimension.font16, color: AppColors.paraColor, height: 1.5,),
              InkWell(
                onTap: () {
                  setState(() {
                    hiddenText=!hiddenText; 
                  });
                },
                child: Row(
                  children: [
                    SmallText(text: hiddenText? "Show more": "Show less", color: AppColors.mainColor, size: Dimension.font16, height: 1.5, ),
                     Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up,  color: AppColors.mainColor, )
                  ],
                ),
              )
            ],
          ),
    );
  }
}
