import 'package:product_app/core/services/api_service.dart';
import 'package:product_app/features/products/data/models/product_model.dart';

class ProductRemoteDataSource {
  final ApiService _apiService;

  ProductRemoteDataSource(this._apiService);

  Future<List<String>> getAllCategories() async {
    final response = await _apiService.getAllCategories();
    return List<String>.from(response.data);
  }

  Future<List<ProductModel>> getAllProducts() async {
    final response = await _apiService.getAllProducts();
    return (response.data as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }

  Future<List<ProductModel>> getProductsByCategory(String category) async {
    final response = await _apiService.getProductsByCategory(category);
    if (response.data == null) {
      throw Exception('Failed to fetch products by category');
    }
    return (response.data as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }
}
