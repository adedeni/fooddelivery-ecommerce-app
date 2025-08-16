import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/base/custom_loader.dart';
import 'package:food_delivery_ecommerce/base/custom_snack_bar.dart';
import 'package:food_delivery_ecommerce/controllers/auth_controller.dart';
import 'package:food_delivery_ecommerce/models/sign_up_model.dart';
import 'package:food_delivery_ecommerce/routes/route_helper.dart';
import 'package:food_delivery_ecommerce/screens/auth/sign_in_page.dart';
import 'package:food_delivery_ecommerce/utilities/colors.dart';
import 'package:food_delivery_ecommerce/utilities/dimension.dart';
import 'package:food_delivery_ecommerce/widgets/big_text.dart';
import 'package:food_delivery_ecommerce/widgets/field_input_widget.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var signUpImages = ['t.png', "f.png", "g.png"];

    void _registration(AuthController authController) {
      //var authController = Get.find<AuthController>();
      String name = nameController.text.trim();
      String phone = phoneController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (name.isEmpty) {
        customSnackBar('Type in your name', title: 'Name');
      } else if (phone.isEmpty) {
        customSnackBar('Type in your phone number', title: 'Phone number');
      } else if (email.isEmpty) {
        customSnackBar('Type in your email', title: 'Email address');
      } else if (!GetUtils.isEmail(email)) {
        customSnackBar('Type in a valid email address',
            title: 'Valid email address');
      } else if (password.isEmpty) {
        customSnackBar('Type in your password', title: 'Password');
      } else if (password.length < 6) {
        customSnackBar('Password cannot be less than 6 characters',
            title: 'Password');
      } else {
        //customSnackBar('Welcome!', title: 'Success');
        // ignore: unused_local_variable
        SignUpModel signUpModel = SignUpModel(
            name: name,
            phone: phone,
            email: email,
            password: password,
            );
        // print(signUpModel.toString());
        authController.registration(signUpModel).then((status) {
          if (status.isSuccess) {
            Get.toNamed(RouteHelper.getInitial());
          } else {
            customSnackBar(status.message);
          }
        });
      }
    }

    return Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (_authController) {
          return !_authController.isLoading
              ? SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(top: Dimension.screenHeight * 0.05),
                        height: Dimension.screenHeight * 0.25,
                        child: Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: Dimension.radius20 * 4,
                            backgroundImage: const AssetImage(
                                'assets/image/logo part 1.png'),
                          ),
                        ),
                      ),
                      FieldInputWidget(
                          textEditingController: emailController,
                          hintText: 'Email',
                          icon: Icons.email),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      FieldInputWidget(
                        textEditingController: passwordController,
                        hintText: 'Password',
                        icon: Icons.password_sharp,
                        isObscure: true,
                      ),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      FieldInputWidget(
                          textEditingController: nameController,
                          hintText: 'Name',
                          icon: Icons.person),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      FieldInputWidget(
                          textEditingController: phoneController,
                          hintText: 'Phone',
                          icon: Icons.phone),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      GestureDetector(
                        onTap: () {
                          _registration(_authController);
                        },
                        child: Container(
                          width: Dimension.screenWidth / 2,
                          height: Dimension.screenHeight / 13,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimension.radius30),
                            color: AppColors.mainColor,
                          ),
                          child: Center(
                            child: BigText(
                              text: 'Sign up',
                              size: Dimension.font16 * 1.9,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimension.height10,
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Have an account? ',
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimension.font20),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.to(const SignInPage(),
                                      transition: Transition.fade),
                                text: ' Login',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.mainBlackColor,
                                    fontSize: Dimension.font20),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: Dimension.screenHeight * 0.05,
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Sign up using one of the following methods',
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimension.font16)),
                      ),
                      Wrap(
                        children: List.generate(
                            3,
                            (index) => Padding(
                                  padding: EdgeInsets.all(Dimension.width10),
                                  child: CircleAvatar(
                                    radius: Dimension.radius30,
                                    backgroundImage: AssetImage(
                                        'assets/image/' + signUpImages[index]),
                                  ),
                                )),
                      )
                    ],
                  ),
                )
              : const CustomLoader();
        }));
  }
}
