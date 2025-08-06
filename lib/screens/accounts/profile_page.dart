import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/utilities/colors.dart';
import 'package:food_delivery_ecommerce/utilities/dimension.dart';
import 'package:food_delivery_ecommerce/widgets/app_icon.dart';
import 'package:food_delivery_ecommerce/widgets/big_text.dart';
import 'package:food_delivery_ecommerce/widgets/profile_page_list.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Container(
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
                      bigText: BigText(text: 'Adedeni')),
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
                      bigText: BigText(text: '09036176161')),
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
                      bigText: BigText(text: 'olayodeadeshina@gmail.com')),
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
                      bigText: BigText(text: 'Fill in your address')),
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
                      bigText: BigText(text: 'Type in your message')),
                      
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
