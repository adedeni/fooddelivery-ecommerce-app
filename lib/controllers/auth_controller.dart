import 'package:food_delivery_ecommerce/data/repository/auth_repository.dart';
import 'package:food_delivery_ecommerce/models/response_model.dart';
import 'package:food_delivery_ecommerce/models/sign_up_model.dart';
import 'package:get/get.dart';


class AuthController extends GetxController implements GetxService {
  final AuthRepository authRepository;
  AuthController({
    required this.authRepository
  });
  bool _isLoading = false;
  bool get isLoading => _isLoading;
 Future<ResponseModel> registration(SignUpModel signUpModel) async {
    _isLoading= true;
    update();
    Response response = await authRepository.registration(signUpModel);
    late ResponseModel responseModel;
    if (response.statusCode==200) {
      authRepository.savedUserToken(response.body['token']);
      responseModel = ResponseModel(true, response.body['token']);
    }else{
       responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading=false;
    update();
    return responseModel;
  }
}
