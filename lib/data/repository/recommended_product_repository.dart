import 'package:food_delivery_ecommerce/data/api/api_client.dart';
import 'package:food_delivery_ecommerce/utilities/app_contants.dart';
import 'package:get/get.dart';

class RecommendedProductRepository extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepository( {required this.apiClient});
  Future<Response> getRecommendedProductList() async{
    return await apiClient.getData(AppContants.RECOMMENDED_PRODUCT_URI) ;
  }
}
