import 'package:food_delivery_ecommerce/data/repository/auth_repository.dart';
import 'package:food_delivery_ecommerce/models/response_model.dart';
import 'package:food_delivery_ecommerce/models/sign_up_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepository authRepository;
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  AuthController({required this.authRepository});

  Future<ResponseModel> registration(SignUpModel signUpModel) async {
    _isLoading = true;
    update();
    Response response = await authRepository.registration(signUpModel);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepository.savedUserToken(response.body['token']);
      responseModel = ResponseModel(true, response.body['token']);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(String email, String password) async {
   // print('Getting token...');
   // print(authRepository.getUserToken().toString());
    _isLoading = true;
    update();
    Response response = await authRepository.login(email, password);
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
     // print('Getting backend token ');
      authRepository.savedUserToken(response.body['token']);
    // print('user token is ' + response.body['token'].toString());
      responseModel = ResponseModel(true, response.body['token']);
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }

  void saveUserNumberAndPassword(String number, String password) {
    authRepository.saveUserNumberAndPassword(number, password);
  }

  bool userLoggedIn()  {
    return authRepository.userLoggedIn();
  }

  bool clearShareData(){
    return authRepository.clearShareData();
  }
}
