// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:food_delivery_ecommerce/models/cart_model.dart';
import 'package:food_delivery_ecommerce/utilities/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepository {
  final SharedPreferences sharedPreferences;

  CartRepository({required this.sharedPreferences});

  List<String> cart = [];

  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    //this is to remove what is in the cart list on the local storage for debugging purpose
    sharedPreferences.remove(AppConstants.CART_LIST);

    sharedPreferences.remove(AppConstants.CART_HISTORY_LIST);
    // return;

    var time = DateTime.now().toString();
    cart = [];
    //convert object to string because shared preferences only accepts string
    cartList.forEach((element) {
      element.time = time;
      return cart.add(jsonEncode(element));
    });
    sharedPreferences.setStringList(AppConstants.CART_LIST, cart);
    //print(sharedPreferences.getStringList(AppConstants.CART_LIST));
    //getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstants.CART_LIST)!;
      //print("list inside cart list " + carts.toString());
    }
    List<CartModel> cartList = [];

    carts.forEach((element) {
      return cartList.add(CartModel.fromJson(jsonDecode(element)));
    });
    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartHistory = [];
      cartHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }

    List<CartModel> cartListHistory = [];
    cartHistory.forEach((element) {
      return cartListHistory.add(CartModel.fromJson(jsonDecode(element)));
    });
    return cartListHistory;
  }

  void addToCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstants.CART_HISTORY_LIST)) {
      cartHistory =
          sharedPreferences.getStringList(AppConstants.CART_HISTORY_LIST)!;
    }
    for (int i = 0; i < cart.length; i++) {
      //print("the history list is " + cart[i]);
      cartHistory.add(cart[i]);
      for (int j = 0; j < getCartHistoryList().length; j++) {
        //print('the time of the order is ' + getCartHistoryList()[j].time.toString());
      }
    }

    removeCart();
    sharedPreferences.setStringList(
        AppConstants.CART_HISTORY_LIST, cartHistory);

    // print("the length of history list is " +
    //     getCartHistoryList().length.toString());
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstants.CART_LIST);
  }

  void clearCartHistory() {
    removeCart();
    cartHistory = [];
    sharedPreferences.remove(AppConstants.CART_LIST);
  }
}
