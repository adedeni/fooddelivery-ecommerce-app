import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/base/custom_loader.dart';
import 'package:food_delivery_ecommerce/base/custom_snack_bar.dart';
import 'package:food_delivery_ecommerce/controllers/auth_controller.dart';
import 'package:food_delivery_ecommerce/controllers/cart_controller.dart';
import 'package:food_delivery_ecommerce/controllers/user_controller.dart';
import 'package:food_delivery_ecommerce/routes/route_helper.dart';
import 'package:food_delivery_ecommerce/utilities/colors.dart';
import 'package:food_delivery_ecommerce/utilities/dimension.dart';
import 'package:food_delivery_ecommerce/widgets/app_icon.dart';
import 'package:food_delivery_ecommerce/widgets/big_text.dart';
import 'package:food_delivery_ecommerce/widgets/profile_page_list.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool _userLoggedIn = Get.find<AuthController>().userLoggedIn();
    if (_userLoggedIn) {
      Get.find<UserController>().getUserInfo();
    } else {}
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.mainColor,
          title: BigText(
            text: 'Profile',
            size: 24,
            color: Colors.white,
          ),
        ),
        body: GetBuilder<UserController>(builder: (userController) {
          return _userLoggedIn
              ? (userController.isLoading
                  ? Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(top: Dimension.height20),
                      child: Column(children: [
                        //profile
                        AppIcon(
                          icon: Icons.person,
                          backgroundColor: AppColors.mainColor,
                          iconColor: Colors.white,
                          iconSize: Dimension.height15 * 5,
                          size: Dimension.height15 * 10,
                        ),
                        SizedBox(
                          height: Dimension.height30,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                //name
                                ProfilePageList(
                                    appIcon: AppIcon(
                                      icon: Icons.person,
                                      backgroundColor: AppColors.mainColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimension.height10 * 2.5,
                                      size: Dimension.height20 * 2.5,
                                    ),
                                    bigText: BigText(
                                        text: userController.userModel.name)),
                                SizedBox(
                                  height: Dimension.height20,
                                ),
                                //phone
                                ProfilePageList(
                                    appIcon: AppIcon(
                                      icon: Icons.phone,
                                      backgroundColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimension.height10 * 2.5,
                                      size: Dimension.height20 * 2.5,
                                    ),
                                    bigText: BigText(
                                        text: userController.userModel.phone)),
                                SizedBox(
                                  height: Dimension.height20,
                                ),
                                //email
                                ProfilePageList(
                                    appIcon: AppIcon(
                                      icon: Icons.email,
                                      backgroundColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimension.height10 * 2.5,
                                      size: Dimension.height20 * 2.5,
                                    ),
                                    bigText: BigText(
                                        text: userController.userModel.email)),
                                SizedBox(
                                  height: Dimension.height20,
                                ),
                                //address
                                ProfilePageList(
                                    appIcon: AppIcon(
                                      icon: Icons.location_on,
                                      backgroundColor: AppColors.yellowColor,
                                      iconColor: Colors.white,
                                      iconSize: Dimension.height10 * 2.5,
                                      size: Dimension.height20 * 2.5,
                                    ),
                                    bigText:
                                        BigText(text: 'Fill in your address')),
                                SizedBox(
                                  height: Dimension.height20,
                                ),
                                //message
                                ProfilePageList(
                                  appIcon: AppIcon(
                                    icon: Icons.message_outlined,
                                    backgroundColor: Colors.redAccent,
                                    iconColor: Colors.white,
                                    iconSize: Dimension.height10 * 2.5,
                                    size: Dimension.height20 * 2.5,
                                  ),
                                  bigText:
                                      BigText(text: 'Type in your message'),
                                ),
                                SizedBox(
                                  height: Dimension.height20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (Get.find<AuthController>()
                                        .userLoggedIn()) {
                                      Get.find<AuthController>()
                                          .clearShareData();
                                      Get.find<CartController>().clear();
                                      Get.find<CartController>()
                                          .clearCartHistory();
                                      Get.toNamed(RouteHelper.getSignInPage());
                                    } else {
                                      customSnackBar('You were never logged in',
                                          title: 'Logout');
                                    }
                                  },
                                  child: ProfilePageList(
                                    appIcon: AppIcon(
                                      icon: Icons.logout,
                                      backgroundColor: Colors.redAccent,
                                      iconColor: Colors.white,
                                      iconSize: Dimension.height10 * 2.5,
                                      size: Dimension.height20 * 2.5,
                                    ),
                                    bigText: BigText(text: 'Logout'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ]),
                    )
                  : const CustomLoader())
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: double.maxFinite,
                        height: Dimension.height20 * 8,
                        margin: EdgeInsets.only(
                            left: Dimension.width20, right: Dimension.width20),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimension.radius20),
                            image: const DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                    'assets/image/signintocontinue.png'))),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getSignInPage());
                        },
                        child: Container(
                          width: double.maxFinite,
                          height: Dimension.height20 * 5,
                          margin: EdgeInsets.only(
                              left: Dimension.width20, right: Dimension.width20),
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                              borderRadius:
                                  BorderRadius.circular(Dimension.radius20),
                              ),
                              child: Center(child: BigText(text: 'Sign in', color: Colors.white, size: Dimension.font20,)),
                        ),
                      ),
                    ],
                  ),
                );
        }));
  }
}
