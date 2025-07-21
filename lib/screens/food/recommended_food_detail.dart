import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/routes/route_helper.dart';
import 'package:food_delivery_ecommerce/utilities/colors.dart';
import 'package:food_delivery_ecommerce/utilities/dimension.dart';
import 'package:food_delivery_ecommerce/widgets/app_icon.dart';
import 'package:food_delivery_ecommerce/widgets/big_text.dart';
import 'package:food_delivery_ecommerce/widgets/expandable_text.dart';
import 'package:get/get.dart';
//import 'package:get/get_core/src/get_main.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            title:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: const AppIcon(icon: Icons.clear)),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.getPopularFood());
                  },
                  child: const AppIcon(icon: Icons.shopping_cart_outlined))
              ],
            ),
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(20),
                child: Container(
                    child: Center(
                        child: BigText(
                            size: Dimension.font26, text: "Chinese side")),
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(top: 5, bottom: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            Dimension.radius20,
                          ),
                          topRight: Radius.circular(
                            Dimension.radius20,
                          )),
                    ))),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/image/food0.png",
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimension.width20, right: Dimension.width20),
                  child: const ExpandableText(
                    text:
                        ("A chicken (Gallus gallus domesticus) is a domesticated bird that belongs to the family Phasianidae, which also includes pheasants andz turkeys. It is a subspecies of the red junglefowl, native to Southeast Asia, and is believed to have been domesticated over 8,000 years ago. Chickens are among the most widespread and populous domesticated animals in the world, kept primarily for their eggs and meat, though they also hold significance in cultural, religious, and scientific contexts Biologically, chickens are medium-sized birds with strong legs, short wings that limit their ability to fly, a beak adapted for pecking, and a comb and wattles that help regulate their body temperature. They exhibit clear sexual dimorphism: males (roosters or cocks) are often larger, more colorful, and equipped with prominent combs, wattles, and tail feathers, while females (hens) are generally smaller and lay eggs.\nChickens are omnivorous and have a diverse diet that includes seeds, insects, small animals, and kitchen scraps. Their digestive system features a crop and gizzard that allow them to process coarse and varied food materials. Social animals by nature, chickens display complex behaviors, including pecking order hierarchies, vocal communication, and even rudimentary problem-solving abilities."),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: Dimension.width25 * 2,
                right: Dimension.width25 * 2,
                top: Dimension.height10,
                bottom: Dimension.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    iconSize: Dimension.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.remove),
                BigText(
                  text: "\$12.88 " ' X ' ' 0 ',
                  color: AppColors.mainBlackColor,
                  size: Dimension.font26,
                ),
                AppIcon(
                    iconSize: Dimension.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.add),
              ],
            ),
          ),
          Container(
            height: Dimension.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimension.height30,
                bottom: Dimension.height30,
                left: Dimension.width20,
                right: Dimension.width20),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  Dimension.radius20 * 2,
                ),
                topRight: Radius.circular(Dimension.radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimension.height20,
                      bottom: Dimension.height10,
                      right: Dimension.width20,
                      left: Dimension.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius20),
                      color: Colors.white),
                  child: const Icon(Icons.favorite, color: AppColors.mainColor,)
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimension.height20,
                      bottom: Dimension.height10,
                      right: Dimension.width20,
                      left: Dimension.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimension.radius20),
                    color: AppColors.mainColor,
                  ),
                  child: BigText(
                    text: "\$10 | Add to cart",
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
