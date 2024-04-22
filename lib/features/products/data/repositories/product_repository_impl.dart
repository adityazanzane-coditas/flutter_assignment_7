import 'package:product_app/features/products/data/datasources/product_remote_data_source.dart';
import 'package:product_app/features/products/domain/entities/product.dart';
import 'package:product_app/features/products/domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource _remoteDataSource;

  ProductRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<String>> getAllCategories() async {
    return await _remoteDataSource.getAllCategories();
  }

  @override
  Future<List<Product>> getAllProducts() async {
    final products = await _remoteDataSource.getAllProducts();
    return products
        .map((e) => Product(
              id: e.id,
              title: e.title,
              price: e.price,
              category: e.category,
              image: e.image,
            ))
        .toList();
  }

  @override
  Future<List<Product>> getProductsByCategory(String category) async {
    final products = await _remoteDataSource.getProductsByCategory(category);
    return products
        .map((e) => Product(
              id: e.id,
              title: e.title,
              price: e.price,
              category: e.category,
              image: e.image,
            ))
        .toList();
  }
}
