import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/utilities/colors.dart';
import 'package:food_delivery_ecommerce/utilities/dimension.dart';
import 'package:food_delivery_ecommerce/widgets/big_text.dart';
import 'package:food_delivery_ecommerce/widgets/icon_and_text.dart';
import 'package:food_delivery_ecommerce/widgets/small_text.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: text, size: Dimension.font26,),
                  SizedBox(
                    height: Dimension.height10,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                          5,
                          (index) {
                            return const Icon(
                              Icons.star,
                              color: AppColors.mainColor,
                              size: 15,
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SmallText(text: "4.5"),
                      const SizedBox(
                        width: 10,
                      ),
                      SmallText(text: "1287"),
                      const SizedBox(
                        width: 10,
                      ),
                      SmallText(text: "Comments")
                    ],
                  ),
                  SizedBox(
                    height: Dimension.height20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndText(
                          icon: Icons.circle_sharp,
                          text: "Normal",
                          iconColor: AppColors.iconColor1),
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
              )
            ;
  }
}