import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/controllers/cart_controller.dart';
import 'package:food_delivery_ecommerce/data/repository/popular_product_repository.dart';
import 'package:food_delivery_ecommerce/models/products_model.dart';
import 'package:food_delivery_ecommerce/utilities/colors.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepository popularProductRepository;
  PopularProductController({required this.popularProductRepository});

  List<dynamic> _popularProductsList = [];
  List<dynamic> get popularProductsList => _popularProductsList;
  late CartController _cart;
  bool _isLoaded = false;

  bool get isLoaded => _isLoaded;

  int _quantity = 0;

  int get quantity {
    return _quantity;
  }

  int _inCartItems = 0;
  int get inCartItems {
    return _inCartItems + _quantity;
  }

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepository.getPopularProductList();
    if (response.statusCode == 200) {
      //print("i am here");
      _popularProductsList = [];
      _popularProductsList.addAll(Products.fromJson(response.body).products);
      //print(_popularProductsList);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement == true) {
      _quantity = checkQuantity(_quantity + 1);
      print('number of items ' + _quantity.toString());
    } else {
      _quantity = checkQuantity(_quantity - 1);
      print('number of items ' + _quantity.toString());
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      //minimum amount of quantity
      Get.snackbar('Item count', 'Minium item count',
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      // maximum amount of quantity
      Get.snackbar('Item count', 'Maximum item count',
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProductData(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    //get from storage _inCartItems
    print('product exist/not is ' + exist.toString());
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
    print('the quantity in the cart is ' + _inCartItems.toString());
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    _cart.items.forEach(
      (key, value) {
        print('the id is ' +
            value.id.toString() +
            'the quantity is ' +
            value.quantity.toString());
      },
    );

    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }
}
