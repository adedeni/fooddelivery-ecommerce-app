// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/base/no_data_page.dart';
import 'package:food_delivery_ecommerce/controllers/cart_controller.dart';
import 'package:food_delivery_ecommerce/controllers/popular_products_controller.dart';
import 'package:food_delivery_ecommerce/controllers/recommended_products_controller.dart';
import 'package:food_delivery_ecommerce/routes/route_helper.dart';
//import 'package:food_delivery_ecommerce/screens/home/main_food_page.dart';
import 'package:food_delivery_ecommerce/utilities/colors.dart';
import 'package:food_delivery_ecommerce/utilities/dimension.dart';
import 'package:food_delivery_ecommerce/widgets/app_icon.dart';
import 'package:food_delivery_ecommerce/widgets/big_text.dart';
import 'package:food_delivery_ecommerce/widgets/small_text.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Positioned(
                left: Dimension.width20,
                right: Dimension.width20,
                top: Dimension.height30 * 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcon(
                      icon: Icons.arrow_back_ios,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimension.iconSize24,
                    ),
                    SizedBox(
                      width: Dimension.width25 * 4,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getInitial());
                      },
                      child: AppIcon(
                        icon: Icons.home_outlined,
                        iconColor: Colors.white,
                        backgroundColor: AppColors.mainColor,
                        iconSize: Dimension.iconSize24,
                      ),
                    ),
                    AppIcon(
                      icon: Icons.shopping_cart,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      iconSize: Dimension.iconSize24,
                    )
                  ],
                )),
            GetBuilder<CartController>(builder: (_cartController) {
              return _cartController.getItems.isNotEmpty
                  ? Positioned(
                      top: Dimension.height20 * 5,
                      left: Dimension.width20,
                      right: Dimension.width20,
                      bottom: 0,
                      child: Container(
                        margin: EdgeInsets.only(top: Dimension.height15),
                        //color: Colors.orange,
                        child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: GetBuilder<CartController>(
                                builder: (cartController) {
                              var _cartList = cartController.getItems;
                              return ListView.builder(
                                  itemCount: _cartList.length,
                                  itemBuilder: (_, index) {
                                    return Container(
                                      height: Dimension.height20 * 5,
                                      width: double.maxFinite,
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              var popularIndex = Get.find<
                                                      PopularProductController>()
                                                  .popularProductsList
                                                  .indexOf(_cartList[index]
                                                      .product!);
                                              if (popularIndex >= 0) {
                                                Get.toNamed(
                                                    RouteHelper.getPopularFood(
                                                        popularIndex,
                                                        "cartpage"));
                                              } else {
                                                var recommendedIndex = Get.find<
                                                        RecommendedProductController>()
                                                    .recommendedProductsList
                                                    .indexOf(_cartList[index]
                                                        .product!);
                                                if (recommendedIndex < 0) {
                                                  Get.snackbar(
                                                      'Product history',
                                                      'Product review is not available for this product',
                                                      backgroundColor:
                                                          Colors.redAccent,
                                                      colorText: Colors.white);
                                                } else {
                                                  Get.toNamed(RouteHelper
                                                      .getRecommendedFood(
                                                          recommendedIndex,
                                                          "cartpage"));
                                                }
                                              }
                                            },
                                            child: Container(
                                              width: Dimension.width25 * 4,
                                              height: Dimension.height20 * 5,
                                              margin: EdgeInsets.only(
                                                  bottom: Dimension.height10),
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                        cartController
                                                            .getItems[index]
                                                            .img!)),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimension.radius20),
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: Dimension.width10,
                                          ),
                                          Expanded(
                                              child: Container(
                                            height: Dimension.height20 * 5,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                BigText(
                                                  text: cartController
                                                      .getItems[index].name!,
                                                  color: Colors.black45,
                                                ),
                                                SmallText(
                                                  text: "Spicy",
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    BigText(
                                                      text: cartController
                                                          .getItems[index]
                                                          .price!
                                                          .toString(),
                                                      color: Colors.redAccent,
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(
                                                          top: Dimension
                                                              .height10,
                                                          bottom: Dimension
                                                              .height10,
                                                          right:
                                                              Dimension.width10,
                                                          left: Dimension
                                                              .width10),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  Dimension
                                                                      .radius20),
                                                          color: Colors.white),
                                                      child: Row(
                                                        children: [
                                                          GestureDetector(
                                                            onTap: () {
                                                              // popularProduct.setQuantity(false);
                                                              cartController.addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  -1);
                                                              // print('removing item is tapped');
                                                            },
                                                            child: const Icon(
                                                              Icons.remove,
                                                              color: AppColors
                                                                  .signcolor,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width: Dimension
                                                                    .width10 /
                                                                2,
                                                          ),
                                                          BigText(
                                                            //text: popularProduct.inCartItems.toString()
                                                            text:
                                                                _cartList[index]
                                                                    .quantity
                                                                    .toString(),
                                                            size: Dimension
                                                                .font16,
                                                          ),
                                                          SizedBox(
                                                            width: Dimension
                                                                    .width10 /
                                                                2,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              // popularProduct.setQuantity(true);
                                                              cartController.addItem(
                                                                  _cartList[
                                                                          index]
                                                                      .product!,
                                                                  1);
                                                              // print('adding item is tapped');
                                                            },
                                                            child: const Icon(
                                                              Icons.add,
                                                              color: AppColors
                                                                  .signcolor,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ))
                                        ],
                                      ),
                                    );
                                  });
                            })),
                      ))
                  : const NoDataPage(text: 'Your cart is empty');
            })
          ],
        ),
        bottomNavigationBar:
            GetBuilder<CartController>(builder: (cartController) {
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
            child: cartController.getItems.isNotEmpty
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            top: Dimension.height15,
                            bottom: Dimension.height15,
                            right: Dimension.width15,
                            left: Dimension.width15),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimension.radius20),
                            color: Colors.white),
                        child: Row(
                          children: [
                            SizedBox(
                              width: Dimension.width10 / 2,
                            ),
                            BigText(
                              text:
                                  "\$" + cartController.totalAmount.toString(),
                              size: Dimension.font16,
                            ),
                            SizedBox(
                              width: Dimension.width10 / 2,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //popularProduct.addItem(product);

                          cartController.addToHistory();
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              top: Dimension.height15,
                              bottom: Dimension.height15,
                              right: Dimension.width15,
                              left: Dimension.width15),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimension.radius20),
                            color: AppColors.mainColor,
                          ),
                          child: BigText(
                            text: "Check out",
                            size: Dimension.font16 * 1.2,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  )
                : Container(),
          );
        }));
  }
}
