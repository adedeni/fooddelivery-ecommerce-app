import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/controllers/auth_controller.dart';
import 'package:food_delivery_ecommerce/utilities/colors.dart';
import 'package:food_delivery_ecommerce/utilities/dimension.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    //print('loading ' +Get.find<AuthController>().isLoading.toString());
    return Center(
      child: Container(
        height: Dimension.height20 * 5,
        width: Dimension.height20 * 5,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimension.height20*5/2),
          color: AppColors.mainColor
        ),
        alignment: Alignment.center,
        child: const CircularProgressIndicator( color: Colors.white,),
      ),
    );
  }
}
