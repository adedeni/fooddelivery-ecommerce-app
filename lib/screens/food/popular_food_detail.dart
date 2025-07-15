import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/utilities/colors.dart';

import 'package:food_delivery_ecommerce/utilities/dimension.dart';
import 'package:food_delivery_ecommerce/widgets/app_column.dart';
import 'package:food_delivery_ecommerce/widgets/app_icon.dart';
import 'package:food_delivery_ecommerce/widgets/big_text.dart';
import 'package:food_delivery_ecommerce/widgets/expandable_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimension.popularFoodImgSize,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/image/food0.png"))),
            ),
          ),
          //icon widget
          Positioned(
            top: Dimension.height45,
            left: Dimension.width20,
            right: Dimension.width20,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_checkout_outlined),
              ],
            ),
          ),
          //introduction of food
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimension.popularFoodImgSize - 20,
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimension.width15,
                      top: Dimension.height20,
                      right: Dimension.width20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimension.radius20),
                        topRight: Radius.circular(Dimension.radius20),
                      ),
                      color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppColumn(
                        text: "Chinese Side",
                      ),
                      SizedBox(
                        height: Dimension.height20,
                      ),
                      BigText(text: "Introduce"),
                      SizedBox(
                        height: Dimension.height10,
                      ),
                       const Expanded(
                         child: SingleChildScrollView(
                            child: ExpandableText(
                                text:
                                    "A chicken (Gallus gallus domesticus) is a domesticated bird that belongs to the family Phasianidae, which also includes pheasants and turkeys. It is a subspecies of the red junglefowl, native to Southeast Asia, and is believed to have been domesticated over 8,000 years ago. Chickens are among the most widespread and populous domesticated animals in the world, kept primarily for their eggs and meat, though they also hold significance in cultural, religious, and scientific contexts Biologically, chickens are medium-sized birds with strong legs, short wings that limit their ability to fly, a beak adapted for pecking, and a comb and wattles that help regulate their body temperature. They exhibit clear sexual dimorphism: males (roosters or cocks) are often larger, more colorful, and equipped with prominent combs, wattles, and tail feathers, while females (hens) are generally smaller and lay eggs.\nChickens are omnivorous and have a diverse diet that includes seeds, insects, small animals, and kitchen scraps. Their digestive system features a crop and gizzard that allow them to process coarse and varied food materials. Social animals by nature, chickens display complex behaviors, including pecking order hierarchies, vocal communication, and even rudimentary problem-solving abilities.\nIn agriculture, chickens are raised in a variety of systems, ranging from large-scale industrial poultry farms to small backyard coops. They are broadly categorized as layers (bred for egg production) and broilers (bred for meat). Modern breeding practices have resulted in highly productive commercial strains, though often at the expense of genetic diversity and animal welfare.")),
                       )
                    ],
                  ))),
          //expandable text widget
        ],
      ),
      bottomNavigationBar: Container(
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
              child: Row(
                children: [
                  const Icon(
                    Icons.remove,
                    color: AppColors.signcolor,
                  ),
                  SizedBox(
                    width: Dimension.width10 / 2,
                  ),
                  BigText(text: "0"),
                  SizedBox(
                    width: Dimension.width10 / 2,
                  ),
                  const Icon(
                    Icons.add,
                    color: AppColors.signcolor,
                  ),
                ],
              ),
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
    );
  }
}
