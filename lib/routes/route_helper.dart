//import 'package:flutter/foundation.dart';
// ignore_for_file: unnecessary_string_interpolations

import 'package:food_delivery_ecommerce/screens/cart/cart_page.dart';
import 'package:food_delivery_ecommerce/screens/food/popular_food_detail.dart';
import 'package:food_delivery_ecommerce/screens/food/recommended_food_detail.dart';
import 'package:food_delivery_ecommerce/screens/home/home_page.dart';
import 'package:food_delivery_ecommerce/screens/splash/splash_page.dart';
//import 'package:food_delivery_ecommerce/screens/home/main_food_page.dart';
import 'package:get/route_manager.dart';

class RouteHelper {
  static const String splashScreen = "/spash-screen";
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";
  static const String cartPage = "/cart-page";

  static String getSplashScreen() => '$splashScreen';
  static String getInitial() => '$initial';
  static String getPopularFood(int pageId, String page) =>
      '$popularFood?pageId=$pageId&page=$page';
  static String getRecommendedFood(int pageId, String page) =>
      '$recommendedFood?pageId=$pageId&page=$page';
  static String getCartPage() => '$cartPage';

  static List<GetPage> routes = [
    GetPage(
        name: splashScreen,
        page: () {
          return const SplashScreen();
        }),
    GetPage(
        name: initial,
        page: () {
          return const HomePage();
        },
        transition: Transition.fadeIn),
    GetPage(
        name: popularFood,
        page: () {
          // print("this work");
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters["page"];
          return PopularFoodDetail(
            pageId: int.parse(pageId!),
            page: page!,
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
          // print("this work");
          var pageId = Get.parameters['pageId'];
          var page = Get.parameters['page'];
          return RecommendedFoodDetail(
            pageId: int.parse(pageId!),
            page: page!,
          );
        },
        transition: Transition.fadeIn),
    GetPage(
        name: cartPage,
        page: () {
          return const CartPage();
        },
        transition: Transition.fadeIn)
  ];
}
