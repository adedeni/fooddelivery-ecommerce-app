import 'package:food_delivery_ecommerce/data/repository/auth_repository.dart';
import 'package:food_delivery_ecommerce/models/sign_up_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepository authRepository;
  AuthController({
    required this.authRepository
  });
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  registration(SignUpModel signUpModel) async {
    _isLoading= true;
    Response response = await authRepository.registration(signUpModel);
    if (response.statusCode==200) {
      SharedPreferences;
    }else{

    }
  }
}
