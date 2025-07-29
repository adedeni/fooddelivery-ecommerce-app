import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/controllers/popular_products_controller.dart';
import 'package:food_delivery_ecommerce/controllers/recommended_products_controller.dart';
import 'package:food_delivery_ecommerce/routes/route_helper.dart';
//import 'package:food_delivery_ecommerce/screens/cart/cart_page.dart';
//import 'package:food_delivery_ecommerce/screens/food/popular_food_detail.dart';
//import 'package:food_delivery_ecommerce/screens/food/recommended_food_detail.dart';
//import 'package:food_delivery_ecommerce/screens/home/food_page_body.dart';
import 'package:food_delivery_ecommerce/screens/home/main_food_page.dart';

import 'package:get/get.dart';
import 'helper/dependencies.dart' as dependencies;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencies.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,

      
      //home: PopularFoodDetail(),
      //home: RecommendedFoodDetail(),
   
      //home:  CartPage(),
      home: const MainFoodPage(),
      initialRoute: RouteHelper.initial,
     getPages: RouteHelper.routes,
      
    );
  }
}
