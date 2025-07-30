// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:food_delivery_ecommerce/models/cart_model.dart';
import 'package:food_delivery_ecommerce/utilities/app_contants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepository {
  final SharedPreferences sharedPreferences;

  CartRepository({required this.sharedPreferences});

  List<String> cart = [];

  void addToCartList(List<CartModel> cartList) {
    cart = [];
    //convert object to string because sharedpreferences only accepts string
    cartList.forEach((element) {
      return cart.add(jsonEncode(element));
    });
    sharedPreferences.setStringList(AppContants.CART_LIST, cart);
    //print(sharedPreferences.getStringList(AppContants.CART_LIST));
    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppContants.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppContants.CART_LIST)!;
      //print("list inside cartlist " + carts.toString());
    }
    List<CartModel> cartList = [];

    carts.forEach((element) {
      return cartList.add(CartModel.fromJson(jsonDecode(element)));
    });
    return cartList;
  }
}
