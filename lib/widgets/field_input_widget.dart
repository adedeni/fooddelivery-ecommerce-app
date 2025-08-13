import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/utilities/colors.dart';
import 'package:food_delivery_ecommerce/utilities/dimension.dart';

class FieldInputWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final IconData icon;
  final bool isObscure;
 const FieldInputWidget(
      {super.key,
      required this.textEditingController,
      required this.hintText,
      required this.icon,
    this.isObscure=false
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(left: Dimension.height20, right: Dimension.height20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimension.radius15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: Dimension.radius15/5,
                spreadRadius: Dimension.radius15 / 15,
                offset: Offset(Dimension.width10 / 10, Dimension.width10/10),
                color: Colors.grey.withValues(alpha: 0.2))
          ]),
      child: TextField(
        obscureText: isObscure?true:false,
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon:  Icon(
            icon,
            color: AppColors.yellowColor,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimension.radius15),
              borderSide: BorderSide(
                  width: Dimension.width10 / 10, color: Colors.white)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimension.radius30),
              borderSide: BorderSide(
                  width: Dimension.width10 / 10, color: Colors.white)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimension.radius15),
          ),
        ),
      ),
    );
  }
}
