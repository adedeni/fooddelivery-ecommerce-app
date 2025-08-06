import 'package:food_delivery_ecommerce/data/api/api_client.dart';
import 'package:food_delivery_ecommerce/utilities/app_contants.dart';
import 'package:get/get.dart';

class PopularProductRepository extends GetxService {
  final ApiClient apiClient;
  PopularProductRepository( {required this.apiClient});
  Future<Response> getPopularProductList() async{
    return await apiClient.getData(AppContants.DRINKS_URI) ;
  }
}
