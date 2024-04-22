import 'package:product_app/features/products/domain/entities/product.dart';

abstract class ProductRepository {
  Future<List<String>> getAllCategories();
  Future<List<Product>> getAllProducts();
  Future<List<Product>> getProductsByCategory(String category);
}
