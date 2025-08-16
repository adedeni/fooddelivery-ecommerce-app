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
    return await apiClient.postData(
        AppConstants.REGISTRATION_URI, signUpModel.toJson());
  }

   bool userLoggedIn()  {
    return sharedPreferences.containsKey(AppConstants.TOKEN);
  }

  Future<String> getUserToken() async {
    return sharedPreferences.getString(AppConstants.TOKEN) ?? 'None';
  }

  Future<Response> login(String email, String password) async {
    return await apiClient.postData(
        AppConstants.LOGIN_URI, {'email': email, 'password': password});
  }

  Future<bool> savedUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstants.TOKEN, token);
  }

  Future<void> saveUserNumberAndPassword(String number, String password) async {
    try {
      await sharedPreferences.setString(AppConstants.PHONE, number);
      await sharedPreferences.setString(AppConstants.PASSWORD, password);
    } catch (e) {
      rethrow;
    }
  }

  bool clearShareData(){
    sharedPreferences.remove(AppConstants.TOKEN);
    sharedPreferences.remove(AppConstants.PASSWORD);
    sharedPreferences.remove(AppConstants.PHONE);
   apiClient.token= '';
   apiClient.updateHeader('');
    return true;
  }
}
