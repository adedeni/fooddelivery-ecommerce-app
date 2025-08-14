import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/base/custom_loader.dart';
import 'package:food_delivery_ecommerce/base/custom_snack_bar.dart';
import 'package:food_delivery_ecommerce/controllers/auth_controller.dart';
import 'package:food_delivery_ecommerce/routes/route_helper.dart';
import 'package:food_delivery_ecommerce/screens/auth/sign_up_page.dart';
import 'package:food_delivery_ecommerce/utilities/colors.dart';
import 'package:food_delivery_ecommerce/utilities/dimension.dart';
import 'package:food_delivery_ecommerce/widgets/big_text.dart';
import 'package:food_delivery_ecommerce/widgets/field_input_widget.dart';
import 'package:get/get.dart';
//import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    void _login(AuthController authController) {
      //var authController = Get.find<AuthController>();

      String email = emailController.text.trim();
      String password = passwordController.text.trim();

      if (email.isEmpty) {
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
        authController.login(email, password).then((status) {
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
        body: GetBuilder<AuthController>(builder: (_authcontroller) {
          return !_authcontroller.isLoading
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
                      Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.only(left: Dimension.width20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello',
                              style: TextStyle(
                                  fontSize: Dimension.font26 * 2.5,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Sign into your account',
                              style: TextStyle(
                                  fontSize: Dimension.font20,
                                  color: Colors.grey[500]),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimension.height20,
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
                      Row(
                        children: [
                          Expanded(child: Container()),
                          RichText(
                            text: TextSpan(
                                text: 'Sign into your account',
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: Dimension.font20)),
                          ),
                          SizedBox(
                            width: Dimension.width20,
                          )
                        ],
                      ),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      GestureDetector(
                        onTap: () {
                          _login(_authcontroller);
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
                              text: 'Sign in',
                              size: Dimension.font16 * 1.9,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimension.screenHeight * 0.05,
                      ),
                      RichText(
                        text: TextSpan(
                            text: 'Don\'t have an account?',
                            style: TextStyle(
                                color: Colors.grey[500],
                                fontSize: Dimension.font20),
                            children: [
                              TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () => Get.to(const SignUpPage()),
                                text: ' Create',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.mainBlackColor,
                                    fontSize: Dimension.font20),
                              )
                            ]),
                      ),
                    ],
                  ),
                )
              : const CustomLoader();
        }));
  }
}
