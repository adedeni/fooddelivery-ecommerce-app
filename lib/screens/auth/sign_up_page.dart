import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/utilities/colors.dart';
import 'package:food_delivery_ecommerce/utilities/dimension.dart';
import 'package:food_delivery_ecommerce/widgets/big_text.dart';
import 'package:food_delivery_ecommerce/widgets/field_input.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: Dimension.screenHeight * 0.05),
              height: Dimension.screenHeight * 0.25,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: Dimension.radius20 * 4,
                  backgroundImage:
                      const AssetImage('assets/image/logo part 1.png'),
                ),
              ),
            ),
            FieldInput(
                textEditingController: emailController,
                hintText: 'Email',
                icon: Icons.email),
            SizedBox(
              height: Dimension.height20,
            ),
            FieldInput(
                textEditingController: passwordController,
                hintText: 'Pasword',
                icon: Icons.password_sharp),
            SizedBox(
              height: Dimension.height20,
            ),
            FieldInput(
                textEditingController: nameController,
                hintText: 'Name',
                icon: Icons.person),
            SizedBox(
              height: Dimension.height20,
            ),
            FieldInput(
                textEditingController: phoneController,
                hintText: 'Phone',
                icon: Icons.phone),
            SizedBox(
              height: Dimension.height20,
            ),
            Container(
              width: Dimension.screenWidth / 2,
              height: Dimension.screenHeight / 13,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius30),
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
            SizedBox(
              height: Dimension.height10,
            ),
            RichText(
              text: TextSpan(
                  recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
                  text: 'Have an account?',
                  style: TextStyle(
                      color: Colors.grey[500], fontSize: Dimension.font20)),
            ),
            SizedBox(
              height: Dimension.screenHeight * 0.05,
            ),
            RichText(
              text: TextSpan(
                  text: 'Sign up using one of the following methods',
                  style: TextStyle(
                      color: Colors.grey[500], fontSize: Dimension.font16)),
            ),
            Wrap(
              children: List.generate(
                  3,
                  (index) => Padding(
                        padding: EdgeInsets.all(Dimension.width10),
                        child: CircleAvatar(
                          radius: Dimension.radius30,
                          backgroundImage:
                              AssetImage('assets/image/' + signUpImages[index]),
                        ),
                      )),
            )
          ],
        ),
      ),
    );
  }
}
