import 'package:food_delivery_ecommerce/controllers/popular_products_controller.dart';
import 'package:food_delivery_ecommerce/controllers/recommended_products_controller.dart';
import 'package:food_delivery_ecommerce/data/api/api_client.dart';
import 'package:food_delivery_ecommerce/data/repository/popular_product_repository.dart';
import 'package:food_delivery_ecommerce/data/repository/recommended_product_repository.dart';
import 'package:food_delivery_ecommerce/utilities/app_contants.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';

Future<void> init() async {
  //api client
  Get.lazyPut(() => ApiClient(appBaseUrl: AppContants.BASE_URL));
  //repository
  Get.lazyPut(() => PopularProductRepository(apiClient: Get.find()));
  Get.lazyPut(() => RecommendedProductRepository(apiClient: Get.find()));
  //controllers
  Get.lazyPut(() => PopularProductController(popularProductRepository: Get.find()));
  Get.lazyPut(() => RecommendedProductController(recommendedProductRepository: Get.find()));
}
