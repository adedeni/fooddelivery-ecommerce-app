
import 'package:food_delivery_ecommerce/data/repository/user_repository.dart';

import 'package:food_delivery_ecommerce/models/user_model.dart';
import 'package:get/get.dart';

import '../models/response_model.dart';

class UserController extends GetxController implements GetxService {
  final UserRepository userRepository;

   UserController({required this.userRepository});

  bool _isLoading = false;
  late UserModel _userModel;

  bool get isLoading => _isLoading;
  UserModel get userModel => _userModel;
 

  Future<ResponseModel> getUserInfo() async {
   
    Response response = await userRepository.getUserInfo();
    late ResponseModel responseModel;
    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);
      _isLoading=true;
      responseModel = ResponseModel(true, 'Successfully');
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }
  
    update();
    return responseModel;
  }

}
