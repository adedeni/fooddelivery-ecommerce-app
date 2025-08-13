import 'package:food_delivery_ecommerce/controllers/auth_controller.dart';
import 'package:food_delivery_ecommerce/controllers/cart_controller.dart';
import 'package:food_delivery_ecommerce/controllers/popular_products_controller.dart';
import 'package:food_delivery_ecommerce/controllers/recommended_products_controller.dart';
import 'package:food_delivery_ecommerce/data/api/api_client.dart';
import 'package:food_delivery_ecommerce/data/repository/auth_repository.dart';
import 'package:food_delivery_ecommerce/data/repository/cart_repository.dart';
import 'package:food_delivery_ecommerce/data/repository/popular_product_repository.dart';
import 'package:food_delivery_ecommerce/data/repository/recommended_product_repository.dart';
import 'package:food_delivery_ecommerce/utilities/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:get/get_core/src/get_main.dart';

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();

  //shared preferences
  Get.lazyPut(() {
    return sharedPreferences;
  });
  //api client
  Get.lazyPut(() {
    return ApiClient(appBaseUrl: AppConstants.BASE_URL);
  });

  //repository
  Get.lazyPut(() {
    return PopularProductRepository(apiClient: Get.find());
  });
  Get.lazyPut(() {
    return RecommendedProductRepository(apiClient: Get.find());
  });
  Get.lazyPut(() {
    return CartRepository(sharedPreferences: Get.find());
  });
  Get.lazyPut(() {
    return AuthRepository(apiClient: Get.find(), sharedPreferences: Get.find());
  });

  //controllers
  Get.lazyPut(() {
    return PopularProductController(popularProductRepository: Get.find());
  });
  Get.lazyPut(() {
    return RecommendedProductController(
        recommendedProductRepository: Get.find());
  });
  Get.lazyPut(() => CartController(cartRepository: Get.find()));
  Get.lazyPut(() {
    return AuthController(
        authRepository: Get.find());
  });
}
