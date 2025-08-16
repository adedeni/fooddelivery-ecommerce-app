// ignore_for_file: sized_box_for_whitespace, must_call_super

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/controllers/popular_products_controller.dart';
import 'package:food_delivery_ecommerce/controllers/recommended_products_controller.dart';
import 'package:food_delivery_ecommerce/models/products_model.dart';
import 'package:food_delivery_ecommerce/routes/route_helper.dart';
import 'package:food_delivery_ecommerce/utilities/app_constants.dart';
//import 'package:food_delivery_ecommerce/utilities/app_constants.dart';
import 'package:food_delivery_ecommerce/utilities/colors.dart';
import 'package:food_delivery_ecommerce/utilities/dimension.dart';
import 'package:food_delivery_ecommerce/widgets/app_column.dart';
import 'package:food_delivery_ecommerce/widgets/big_text.dart';
import 'package:food_delivery_ecommerce/widgets/icon_and_text.dart';
import 'package:food_delivery_ecommerce/widgets/small_text.dart';
import 'package:get/get.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);

  var currPageValue = 0.0;
  double scaleFactor = 0.8;
  double height = Dimension.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currPageValue = pageController.page!;

        //print(currPageValue.toString());
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print(MediaQuery.of(context).size.height.toString()); phone height
    //print(MediaQuery.of(context).size.width.toString()); phone width
    return Column(
      children: [
        //slider section
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? Container(
                  //color: Colors.deepOrange,
                  height: Dimension.pageView,

                  child: PageView.builder(
                    controller: pageController,
                    itemCount: popularProducts.popularProductsList.length,
                    itemBuilder: (context, position) {
                      return buildPageItem(position,
                          popularProducts.popularProductsList[position]);
                    },
                  ),
                  
                )
              : const CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),
        //dots indicator section
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return DotsIndicator(
            dotsCount: popularProducts.popularProductsList.isEmpty
                ? 1
                : popularProducts.popularProductsList.length,
            position: currPageValue,
            decorator: DotsDecorator(
                activeColor: AppColors.mainColor,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0))),
          );
        }),
        //popular header
        SizedBox(
          height: Dimension.height30,
        ),
        Container(
          margin: EdgeInsets.only(left: Dimension.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(
                width: Dimension.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: BigText(
                  text: ".",
                  color: Colors.black26,
                ),
              ),
              SizedBox(
                width: Dimension.width10,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 2),
                child: SmallText(text: "Food pairing"),
              )
            ],
          ),
        ),
        //RECOMMENDED FOOD
        //list of food and images
        GetBuilder<RecommendedProductController>(builder: (recommendedProduct) {
          return recommendedProduct.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recommendedProduct.recommendedProductsList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                            RouteHelper.getRecommendedFood(index, "home"));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            left: Dimension.width20,
                            right: Dimension.width20,
                            bottom: Dimension.height10),
                        child: Row(
                          children: [
                            //image section
                            Container(
                              width: Dimension.listViewImgSize,
                              height: Dimension.listViewImgSize,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimension.radius20),
                                color: Colors.white38,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    AppConstants.BASE_URL +
                                        AppConstants.UPLOAD_URI +
                                        recommendedProduct
                                            .recommendedProductsList[index]
                                            .img!, //local hosted
                                    //recommendedProduct.recommendedProductsList[index].img!, //server hosted
                                  ),
                                ),
                              ),
                            ),
                            //text container
                            Expanded(
                              child: Container(
                                height: Dimension.listViewTextContSize,
                                // width: 200,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight:
                                            Radius.circular(Dimension.radius20),
                                        bottomRight: Radius.circular(
                                            Dimension.radius20)),
                                    color: Colors.white),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: Dimension.width10,
                                      right: Dimension.width10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      BigText(
                                          text: recommendedProduct
                                              .recommendedProductsList[index]
                                              .name!),
                                      SizedBox(
                                        width: Dimension.height10,
                                      ),
                                      SmallText(
                                          text: "With chinese characteristics"),
                                      SizedBox(
                                        width: Dimension.height10,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          IconAndText(
                                            icon: Icons.circle_sharp,
                                            text: ".",
                                            iconColor: AppColors.iconColor1,
                                          ),
                                          IconAndText(
                                              icon: Icons.location_on,
                                              text: "1.7km",
                                              iconColor: AppColors.mainColor),
                                          IconAndText(
                                              icon: Icons.access_time_rounded,
                                              text: "32min",
                                              iconColor: AppColors.iconColor2)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })
              : const CircularProgressIndicator(color: AppColors.mainColor);
        })
      ],
    );
  }

  Widget buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == currPageValue.floor()) {
      var currScale = 1 - (currPageValue - index) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currPageValue.floor() + 1) {
      var currScale =
          scaleFactor + (currPageValue - index + 1) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == currPageValue.floor() - 1) {
      var currScale = 1 - (currPageValue - index) * (1 - scaleFactor);
      var currTrans = height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, height * (1 - scaleFactor) / 2, 0);
    }
    return Transform(
      transform: matrix,
      child: Stack(children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(RouteHelper.getPopularFood(index, "home"));
          },
          child: Container(
            height: Dimension.pageViewContainer,
            margin: EdgeInsets.only(
                left: Dimension.width10, right: Dimension.width10, ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimension.radius30),
              color: index.isEven
                  ? const Color(0xFF69c5df)
                  : const Color(0xFF9294cc),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(AppConstants.BASE_URL +
                        AppConstants.UPLOAD_URI +
                        popularProduct.img! //local server image
                    // popularProduct.img!, //n point hosted
                    ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: Dimension.pageViewTextContainer + Dimension.height10,
            margin: EdgeInsets.only(
                left: Dimension.width25,
                right: Dimension.width25,
                bottom: Dimension.height40 ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimension.radius20),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xFFe8e8e8),
                      blurRadius: 5.0,
                      offset: Offset(0, 5)),
                  BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                  BoxShadow(color: Colors.white, offset: Offset(5, 0))
                ]),
            child: Container(
                padding: EdgeInsets.only(
                    top: Dimension.height15, left: 15, right: 15),
                child: AppColumn(text: popularProduct.name!)),
          ),
        ),
      ]),
    );
  }
}
