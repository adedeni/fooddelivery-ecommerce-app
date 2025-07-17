import 'package:food_delivery_ecommerce/data/repository/recommended_product_repository.dart';
import 'package:food_delivery_ecommerce/models/popular_products_model.dart';
import 'package:get/get.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepository recommendedProductRepository;
  RecommendedProductController({required this.recommendedProductRepository});

  List<dynamic> _recommendedProductsList = [];
  List<dynamic> get recommendedProductsList => _recommendedProductsList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  Future<void> getRecommendedProductList() async {
    Response response = await recommendedProductRepository.getRecommendedProductList();
    if (response.statusCode == 200) {
      
      //print("recommended products loaded");
      _recommendedProductsList = [];
      _recommendedProductsList.addAll(Products.fromJson(response.body).products);
      //print(_recommendedProductsList);
      _isLoaded = true;
      update();
    } else {
      print("could not load recommended products");
    }
  }
}
