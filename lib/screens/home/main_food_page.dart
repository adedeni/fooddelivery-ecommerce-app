// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/screens/home/food_page_body.dart';
import 'package:food_delivery_ecommerce/utilities/colors.dart';
import 'package:food_delivery_ecommerce/utilities/dimension.dart';
import 'package:food_delivery_ecommerce/widgets/big_text.dart';
import 'package:food_delivery_ecommerce/widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //header
          Container(
            child: Container(
              margin:  EdgeInsets.only(top: Dimension.height45, bottom: Dimension.height15),
              padding:  EdgeInsets.only(left: Dimension.width20, right: Dimension.width20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(text: "Nigeria", color: AppColors.mainColor,),
                      Row(
                        children: [
                          SmallText(text: "Ibadan", color: Colors.black54,),
                          const Icon(Icons.arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      width: Dimension.height45,
                      height: Dimension.height45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimension.radius15 ),
                        color: AppColors.mainColor,
                      ),
                      child:  Icon(Icons.search, color: Colors.white, size: Dimension.iconSize24,),
                    ),
                  ),
                ],
              ),
            ),
          ),
       //body
       const Expanded(child:  SingleChildScrollView(child: FoodPageBody())),
        ],
      ),
    );
  }
}
