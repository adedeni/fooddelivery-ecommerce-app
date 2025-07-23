import 'package:food_delivery_ecommerce/data/repository/popular_product_repository.dart';
import 'package:food_delivery_ecommerce/models/popular_products_model.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final PopularProductRepository popularProductRepository;
  PopularProductController({required this.popularProductRepository});

  List<dynamic> _popularProductsList = [];
  List<dynamic> get popularProductsList => _popularProductsList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0;

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
      _quantity = _quantity + 1;
    } else {
      _quantity = _quantity - 1;
    }
  }
}
