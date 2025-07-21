// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/utilities/dimension.dart';

class BigText extends StatelessWidget {
   
  final String text;
  Color? color;
  double size;
  TextOverflow overflow;
  BigText({
    super.key,
    this.color = const  Color(0xFF332d2b),
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.size = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size==0? Dimension.font20: size,
        fontWeight: FontWeight.w400,
        fontFamily: 'Roboto',
      ),
    );
  }
}
