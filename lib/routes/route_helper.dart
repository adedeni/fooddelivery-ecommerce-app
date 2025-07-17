//import 'package:flutter/foundation.dart';
import 'package:food_delivery_ecommerce/screens/food/popular_food_detail.dart';
import 'package:food_delivery_ecommerce/screens/food/recommended_food_detail.dart';
import 'package:food_delivery_ecommerce/screens/home/main_food_page.dart';
import 'package:get/route_manager.dart';

class RouteHelper {
  static const String initial="/";
  static const String popularFood="/popular-food";
  static const String recommendedFood="/recommended-food";

  static String getInitial()=> '$initial';
  static String getPopularFood()=> '$popularFood';
  static String getRecommendedFood()=> '$recommendedFood';

  static List<GetPage> routes=[
    GetPage(name: initial, page: (){
      return const MainFoodPage();
      },
      transition: Transition.fadeIn
      ),
    GetPage(name: popularFood, page: () {
     // print("this work");
      return const PopularFoodDetail();
    },
    transition: Transition.fadeIn
    ),
    GetPage(name: recommendedFood, page: () {
     // print("this work");
      return const RecommendedFoodDetail();
    },
    transition: Transition.fadeIn
    )
  ];
}