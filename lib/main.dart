import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/controllers/cart_controller.dart';
import 'package:food_delivery_ecommerce/controllers/popular_products_controller.dart';
import 'package:food_delivery_ecommerce/controllers/recommended_products_controller.dart';
//import 'package:food_delivery_ecommerce/controllers/popular_products_controller.dart';
//import 'package:food_delivery_ecommerce/controllers/recommended_products_controller.dart';
import 'package:food_delivery_ecommerce/routes/route_helper.dart';
//import 'package:food_delivery_ecommerce/screens/splash/splash_page.dart';
//import 'package:food_delivery_ecommerce/screens/cart/cart_page.dart';
//import 'package:food_delivery_ecommerce/screens/food/popular_food_detail.dart';
//import 'package:food_delivery_ecommerce/screens/food/recommended_food_detail.dart';
//import 'package:food_delivery_ecommerce/screens/home/food_page_body.dart';
//import 'package:food_delivery_ecommerce/screens/home/mnain_food_page.dart';

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
    Get.find<CartController>().getCartData();
   return GetBuilder<PopularProductController>(builder: (_){
      return GetBuilder<RecommendedProductController>(builder: (_){
        return  GetMaterialApp(
      debugShowCheckedModeBanner: false,

      
      //home: PopularFoodDetail(),
      //home: RecommendedFoodDetail(),
   
      //home:  CartPage(),
      //home: const MainFoodPage(),
      //home: const SplashScreen(),
      initialRoute: RouteHelper.getSplashScreen(),
      
     getPages: RouteHelper.routes,
      
    );
      });
    });
  }
}
