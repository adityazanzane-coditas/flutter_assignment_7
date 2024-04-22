import 'package:product_app/features/products/domain/entities/product.dart';

abstract class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsLoadingSuccess extends ProductsState {
  final List<String> categories;
  final List<Product> products;

  ProductsLoadingSuccess({
    required this.categories,
    required this.products,
  });
}

class ProductsLoadingFailure extends ProductsState {
  final String errorMessage;

  ProductsLoadingFailure(this.errorMessage);
}
