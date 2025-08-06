import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/utilities/dimension.dart';
import 'package:food_delivery_ecommerce/widgets/app_icon.dart';
import 'package:food_delivery_ecommerce/widgets/big_text.dart';

class ProfilePageList extends StatelessWidget {
  final AppIcon appIcon;
  final BigText bigText;
  const ProfilePageList(
      {super.key, required this.appIcon, required this.bigText});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: Dimension.width20,
          top: Dimension.height10,
          bottom: Dimension.height10),
      child: Row(
        children: [
          appIcon,
          SizedBox(
            width: Dimension.width20,
          ),
          bigText
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
        BoxShadow(
          blurRadius: Dimension.radius15/10,
            offset: Offset(0, Dimension.width10 / 3),
            color: Colors.grey.withValues(alpha: 0.2))
      ]),
    );
  }
}
