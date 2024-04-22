import 'package:product_app/features/products/domain/repositories/product_repository.dart';

class GetAllCategories {
  final ProductRepository _repository;

  GetAllCategories(this._repository);

  Future<List<String>> call() async {
    return await _repository.getAllCategories();
  }
}
