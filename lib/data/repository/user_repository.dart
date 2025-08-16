import 'package:food_delivery_ecommerce/data/api/api_client.dart';
import 'package:food_delivery_ecommerce/utilities/app_constants.dart';
import 'package:get/get.dart';

class UserRepository {
  final ApiClient apiClient;
  UserRepository({required this.apiClient});

  Future<Response> getUserInfo() async {
    return await apiClient.getData(AppConstants.USER_INFO_URI);
  }
}
