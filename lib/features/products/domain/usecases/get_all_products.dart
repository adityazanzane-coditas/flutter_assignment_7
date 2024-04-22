import 'package:product_app/features/products/domain/entities/product.dart';
import 'package:product_app/features/products/domain/repositories/product_repository.dart';

class GetAllProducts {
  final ProductRepository _repository;

  GetAllProducts(this._repository);

  Future<List<Product>> call() async {
    return await _repository.getAllProducts();
  }
}
