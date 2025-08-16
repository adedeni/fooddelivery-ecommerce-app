// ignore_for_file: constant_identifier_names

class AppConstants {
  static const String APP_NAME = "ChopUp";
  static const int APP_VERSION = 1;

//BASE ENDPOINTS
//  static const String BASE_URL = "https://api.npoint.io";
static const String BASE_URL = "http://127.0.0.1:8000"; //computer localhost server
//static const String BASE_URL = "http://172.20.10.2"; for phone

//PRODUCTS ENDPOINTS
  static const String UPLOAD_URI = "/uploads/";
  // static const String POPULAR_PRODUCT_URI = "/98c102e7c9bc8312fd06"; //n point hosted
 static const String POPULAR_PRODUCT_URI = "/api/v1/products/popular"; //local server hosted
  // static const String RECOMMENDED_PRODUCT_URI = "/0ae82c670ce07a18cfac";
 static const String RECOMMENDED_PRODUCT_URI = "/api/v1/products/recommended";
  static const String DRINKS_URI = "/2809da4ecd48e95a5178";
  // static const String DRINKS_URI = "/api/v1/products/recommended";

//USER AND AUTH ENDPOINTS
  static const String REGISTRATION_URI = "/api/v1/auth/register";
  static const String LOGIN_URI = "/api/v1/auth/login";
  static const String USER_INFO_URI = "/api/v1/customer/info";

  static const String CART_LIST = "cart-list";
  static const String CART_HISTORY_LIST = "cart-history-list";

  static const String TOKEN = "";
  static const String PHONE = "";
  static const String PASSWORD = "";
}
