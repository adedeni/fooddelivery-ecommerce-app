import 'package:food_delivery_ecommerce/data/api/api_client.dart';
import 'package:food_delivery_ecommerce/models/sign_up_model.dart';
import 'package:food_delivery_ecommerce/utilities/app_constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepository({required this.apiClient, required this.sharedPreferences});
 Future<Response> registration(SignUpModel signUpModel) async {
   return await  apiClient.post(AppConstants.REGISTRATION_URI, signUpModel.toJson());
  }

  savedUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }
}
