import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/base/no_data_page.dart';
import 'package:food_delivery_ecommerce/controllers/cart_controller.dart';
import 'package:food_delivery_ecommerce/models/cart_model.dart';
import 'package:food_delivery_ecommerce/routes/route_helper.dart';
import 'package:food_delivery_ecommerce/utilities/colors.dart';
import 'package:food_delivery_ecommerce/utilities/dimension.dart';
import 'package:food_delivery_ecommerce/widgets/app_icon.dart';
import 'package:food_delivery_ecommerce/widgets/big_text.dart';
import 'package:food_delivery_ecommerce/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistoryPage extends StatelessWidget {
  const CartHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();

    Map<String, int> cartItemsPerOrder = {};
    for (int i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
          getCartHistoryList[i].time!,
          (value) => ++value,
        );
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }
    //print(cartItemsPerOrder);
    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) {
        return e.value;
      }).toList();
    }

    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) {
        return e.key;
      }).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();
    //print (orderTimes);

    var listCounter = 0;
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColors.mainColor,
            width: double.maxFinite,
            height: Dimension.height20 * 5,
            padding: EdgeInsets.only(top: Dimension.height45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BigText(
                  text: "Cart History",
                  color: Colors.white,
                ),
                const AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: AppColors.mainColor,
                  backgroundColor: AppColors.yellowColor,
                )
              ],
            ),
          ),
          GetBuilder<CartController>(builder: (_cartController) {
            return _cartController.getCartHistoryList().isNotEmpty
                ? Expanded(
                    child: Container(
                        margin: EdgeInsets.only(
                            top: Dimension.height20,
                            left: Dimension.width20,
                            right: Dimension.width20),
                        child: MediaQuery.removePadding(
                          removeTop: true,
                          context: context,
                          child: ListView(
                            children: [
                              for (int i = 0; i < itemsPerOrder.length; i++)
                                Container(
                                    height: Dimension.height20 * 6,
                                    margin: EdgeInsets.only(
                                        bottom: Dimension.height20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        (() {
                                          DateTime parseDate =
                                              DateFormat("yyyy-MM-dd HH:mm:ss")
                                                  .parse(getCartHistoryList[
                                                          listCounter]
                                                      .time!);

                                          var inputDate = DateTime.parse(
                                              parseDate.toString());
                                          var outputFormat =
                                              DateFormat("dd/mm/yyyy hh:mm a");

                                          var outputDate =
                                              outputFormat.format(inputDate);
                                          return BigText(
                                            text: outputDate,
                                          );
                                        }()),
                                        SizedBox(
                                          height: Dimension.height10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            
                                            Expanded(
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  children: List.generate(
                                                    itemsPerOrder[i],
                                                    (index) {
                                                      if (listCounter <
                                                          getCartHistoryList
                                                              .length) {
                                                        listCounter++;
                                                      }
                                                      
                                                      return Container(
                                                        height:
                                                            Dimension.height20 *
                                                                4,
                                                        width:
                                                            Dimension.width20 *
                                                                4,
                                                        margin: EdgeInsets.only(
                                                            right: Dimension
                                                                    .width10 /
                                                                2),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius: BorderRadius
                                                              .circular(Dimension
                                                                      .radius15 /
                                                                  2),
                                                          image:
                                                              DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image: NetworkImage(
                                                                getCartHistoryList[
                                                                        listCounter -
                                                                            1]
                                                                    .img!),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            
                                            SizedBox(
                                              height: Dimension.height20 * 4,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  SmallText(
                                                      text: 'Total',
                                                      color:
                                                          AppColors.titleColor),
                                                  BigText(
                                                    text: itemsPerOrder[i]
                                                            .toString() +
                                                        ' Items',
                                                    size: Dimension.font16,
                                                    color: AppColors.titleColor,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      var orderTime =
                                                          cartOrderTimeToList();
                                                      Map<int, CartModel>
                                                          moreOrder = {};
                                                      for (int j = 0;
                                                          j <
                                                              getCartHistoryList
                                                                  .length;
                                                          j++) {
                                                        if (getCartHistoryList[
                                                                    j]
                                                                .time ==
                                                            orderTime[i]) {
                                                          moreOrder.putIfAbsent(
                                                              getCartHistoryList[
                                                                      j]
                                                                  .id!, () {
                                                            return CartModel
                                                                .fromJson(jsonDecode(
                                                                    jsonEncode(
                                                                        getCartHistoryList[
                                                                            j])));
                                                          });
                                                        }
                                                      }
                                                      Get.find<CartController>()
                                                          .setItems = moreOrder;
                                                      Get.find<CartController>()
                                                          .addToCartList();
                                                      Get.toNamed(RouteHelper
                                                          .getCartPage());
                                                    },
                                                    child: Container(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal: Dimension
                                                                  .width10 /
                                                              2,
                                                          vertical: Dimension
                                                                  .height10 /
                                                              4),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius
                                                            .circular(Dimension
                                                                    .radius15 /
                                                                3),
                                                        border: Border.all(
                                                            width: Dimension
                                                                    .width10 /
                                                                10,
                                                            color: AppColors
                                                                .mainColor),
                                                      ),
                                                      child: SmallText(
                                                        text: "One more",
                                                        size: Dimension.font26 /
                                                            2.21,
                                                        color:
                                                            AppColors.mainColor,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ))
                            ],
                          ),
                        )))
                : SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: const Center(
                        child: NoDataPage(
                      text: 'You have not place any order',
                      imgPath: 'assets/image/empty_box.png',
                    )));
          })
        ],
      ),
    );
  }
}
