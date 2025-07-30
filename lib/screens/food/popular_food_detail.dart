import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/controllers/cart_controller.dart';
import 'package:food_delivery_ecommerce/controllers/popular_products_controller.dart';
import 'package:food_delivery_ecommerce/routes/route_helper.dart';
//import 'package:food_delivery_ecommerce/screens/cart/cart_page.dart';
//import 'package:food_delivery_ecommerce/screens/home/main_food_page.dart';
//import 'package:food_delivery_ecommerce/utilities/app_contants.dart';
import 'package:food_delivery_ecommerce/utilities/colors.dart';

import 'package:food_delivery_ecommerce/utilities/dimension.dart';
import 'package:food_delivery_ecommerce/widgets/app_column.dart';
import 'package:food_delivery_ecommerce/widgets/app_icon.dart';
import 'package:food_delivery_ecommerce/widgets/big_text.dart';
import 'package:food_delivery_ecommerce/widgets/expandable_text.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  final String page;
  const PopularFoodDetail(
      {super.key, required this.pageId, required this.page});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductsList[pageId];
    // print('page id is ' +pageId.toString());
    // print('product name is ' +product.name.toString());
    Get.find<PopularProductController>()
        .initProductData(product, Get.find<CartController>());
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
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(product.img!))),
              ),
            ),
            //icon widget
            Positioned(
              top: Dimension.height45,
              left: Dimension.width20,
              right: Dimension.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => {
                            if (page == "cartpage")
                              {Get.toNamed(RouteHelper.getCartPage())}
                            else
                              {Get.toNamed(RouteHelper.getInitial())}
                          },
                      child: const AppIcon(icon: Icons.arrow_back_ios)),
                  GetBuilder<PopularProductController>(builder: (carticon) {
                    return GestureDetector(
                      onTap: () {
                        if (carticon.totalItems >= 1) {
                          Get.toNamed(RouteHelper.getCartPage());
                        }
                      },
                      child: Stack(
                        children: [
                          const AppIcon(
                              icon: Icons.shopping_cart_checkout_outlined),
                          carticon.totalItems >= 1
                              ? const Positioned(
                                  right: 0,
                                  top: 0,
                                  child: AppIcon(
                                    icon: Icons.circle,
                                    size: 20,
                                    iconColor: Colors.transparent,
                                    backgroundColor: AppColors.mainColor,
                                  ),
                                )
                              : Container(),
                          Get.find<PopularProductController>().totalItems >= 1
                              ? Positioned(
                                  right: 4.5,
                                  top: 1,
                                  child: BigText(
                                    text: Get.find<PopularProductController>()
                                        .totalItems
                                        .toString(),
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                )
                              : Container()
                        ],
                      ),
                    );
                  })
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
                        AppColumn(
                          text: product.name!,
                        ),
                        SizedBox(
                          height: Dimension.height20,
                        ),
                        BigText(text: "Introduce"),
                        SizedBox(
                          height: Dimension.height10,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                              child:
                                  ExpandableText(text: product.description!)),
                        )
                      ],
                    ))),
            //expandable text widget
          ],
        ),
        bottomNavigationBar:
            GetBuilder<PopularProductController>(builder: (popularProduct) {
          return Container(
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
                      top: Dimension.height15,
                      bottom: Dimension.height15,
                      right: Dimension.width15,
                      left: Dimension.width15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius20),
                      color: Colors.white),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(false);
                        },
                        child: const Icon(
                          Icons.remove,
                          color: AppColors.signcolor,
                        ),
                      ),
                      SizedBox(
                        width: Dimension.width10 / 2,
                      ),
                      BigText(
                        text: popularProduct.inCartItems.toString(),
                        size: Dimension.font16,
                      ),
                      SizedBox(
                        width: Dimension.width10 / 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(true);
                        },
                        child: const Icon(
                          Icons.add,
                          color: AppColors.signcolor,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    popularProduct.addItem(product);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: Dimension.height15,
                        bottom: Dimension.height15,
                        right: Dimension.width15,
                        left: Dimension.width15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimension.radius20),
                      color: AppColors.mainColor,
                    ),
                    child: BigText(
                      text: "\$ ${product.price!} | Add to cart",
                      size: Dimension.font16 * 1.2,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          );
        }));
  }
}
