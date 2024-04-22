import 'package:product_app/features/products/domain/entities/product.dart';
import 'package:product_app/features/products/domain/repositories/product_repository.dart';

class GetProductsByCategory {
  final ProductRepository _repository;

  GetProductsByCategory(this._repository);

  Future<List<Product>> call(String category) async {
    return await _repository.getProductsByCategory(category);
  }
}
