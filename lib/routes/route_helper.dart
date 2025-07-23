//import 'package:flutter/foundation.dart';
// ignore_for_file: unnecessary_string_interpolations

import 'package:food_delivery_ecommerce/screens/food/popular_food_detail.dart';
import 'package:food_delivery_ecommerce/screens/food/recommended_food_detail.dart';
import 'package:food_delivery_ecommerce/screens/home/main_food_page.dart';
import 'package:get/route_manager.dart';

class RouteHelper {
  static const String initial="/";
  static const String popularFood="/popular-food";
  static const String recommendedFood="/recommended-food";

  static String getInitial()=> '$initial';
  static String getPopularFood(int pageId)=> '$popularFood?pageId=$pageId';
  static String  getRecommendedFood(int pageId)=> '$recommendedFood?pageId=$pageId';

  static List<GetPage> routes=[
    GetPage(name: initial, page: (){
      return const MainFoodPage();
      },
      transition: Transition.fadeIn
      ),
      
    GetPage(name: popularFood, page: () {
     // print("this work");
     var pageId=Get.parameters['pageId'];
      return  PopularFoodDetail(pageId: int.parse(pageId!) );
    },
    transition: Transition.fadeIn
    ),

    GetPage(name: recommendedFood, page: () {
     // print("this work");
     var pageId=Get.parameters['pageId'];
      return  RecommendedFoodDetail(pageId: int.parse(pageId!) );
    },
    transition: Transition.fadeIn
    )
  ];
}