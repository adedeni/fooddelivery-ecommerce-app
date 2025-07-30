import 'package:flutter/material.dart';
import 'package:food_delivery_ecommerce/data/repository/cart_repository.dart';
import 'package:food_delivery_ecommerce/models/cart_model.dart';
import 'package:food_delivery_ecommerce/models/products_model.dart';
import 'package:food_delivery_ecommerce/utilities/colors.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final CartRepository cartRepository;

  CartController({required this.cartRepository});

  final Map<int, CartModel> _items = {};

  Map<int, CartModel> get items => _items;
//this is for storage and shared preferences

  List<CartModel> storageItems = [];

  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;

        return CartModel(
            id: value.id,
            name: value.name,
            price: value.price,
            img: value.img,
            quantity: value.quantity! + quantity,
            isExist: true,
            time: DateTime.now().toString(),
            product: product);
      });

      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        //print('length of the items is ' + _items.length.toString());
        _items.putIfAbsent(product.id!, () {
          // print('adding item to the cart id' +
          //     product.id!.toString() +
          //     '  ' +
          //     'quantity' +
          //     quantity.toString());
          // _items.forEach((key, value){
          // print('quantity in cart is ' + value.quantity.toString());
          // });
          return CartModel(
              id: product.id,
              name: product.name,
              price: product.price,
              img: product.img,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString(),
              product: product);
        });
      } else {
        Get.snackbar('Items count', 'Add at least one itme',
            backgroundColor: AppColors.mainColor, colorText: Colors.white);
      }
    }
    cartRepository.addToCartList(getItems);
    update();
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id!)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach(
        (key, value) {
          if (key == product.id) {
            quantity = value.quantity!;
          }
        },
      );
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalAmount {
    var total = 0;

    _items.forEach(
      (key, value) {
        total += value.quantity! * value.price!;
      },
    );
    return total;
  }

  List<CartModel> getCartData() {
    setCart = cartRepository.getCartList();
    return storageItems;
  }

  set setCart(List<CartModel> items) {
    storageItems = items;
  //  print("length of cart items " +storageItems.length.toString());
    for (int i = 0; i < storageItems.length; i++) {
      _items.putIfAbsent(storageItems[i].product!.id!, () {
        return storageItems[i];
      });
    }
  }
}
