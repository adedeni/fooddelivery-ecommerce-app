import 'package:get/get.dart';

class Dimension {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  // 820/220 = screenHeight/pageviewcontainercard height;
  static double pageView = screenHeight / 2.563;
  static double pageViewContainer = screenHeight / 3.73;
  static double pageViewTextContainer = screenHeight / 6.84;
//dynamic height padding and margin
  static double height10 = screenHeight / 82;
  static double height15 = screenHeight / 54.67;
  static double height20 = screenHeight / 41;
  static double height30 = screenHeight / 27.34;
  static double height40 = screenHeight / 20.5;
  static double height45 = screenHeight / 18.22;
//dynamic width padding and margin
  static double width10 = screenHeight / 82;
  static double width15 = screenHeight / 54.67;
  static double width20 = screenHeight / 41;
  static double width25 = screenHeight / 32.8;
  static double width30 = screenHeight / 27.34;
  //fonts
  static double font20 = screenHeight / 41;
  //radius
  static double radius15 = screenHeight / 54.67;
  static double radius20 = screenHeight / 41;
  static double radius30 = screenHeight / 27.34;

  //icons size
  static double iconSize24 = screenHeight / 34.17;
}
