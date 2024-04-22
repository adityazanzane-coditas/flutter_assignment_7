import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/core/services/service_locator.dart';
import 'package:product_app/features/products/domain/usecases/get_all_categories.dart';
import 'package:product_app/features/products/domain/usecases/get_all_products.dart';
import 'package:product_app/features/products/domain/usecases/get_products_by_category.dart';
import 'package:product_app/features/products/presentation/blocs/products_event.dart';
import 'package:product_app/features/products/presentation/blocs/products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetAllCategories _getAllCategories;
  final GetAllProducts _getAllProducts;
  final GetProductsByCategory _getProductsByCategory;

  ProductsBloc()
      : _getAllCategories = getIt.get<GetAllCategories>(),
        _getAllProducts = getIt.get<GetAllProducts>(),
        _getProductsByCategory = getIt.get<GetProductsByCategory>(),
        super(ProductsInitial()) {
    on<GetAllCategoriesEvent>(_onGetAllCategories);
    on<GetAllProductsEvent>(_onGetAllProducts);
    on<GetProductsByCategoryEvent>(_onGetProductsByCategory);
  }

  Future<void> _onGetAllCategories(
    GetAllCategoriesEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());
    try {
      final categories = await _getAllCategories();
      final products = await _getAllProducts();
      emit(ProductsLoadingSuccess(categories: categories, products: products));
    } catch (e) {
      emit(ProductsLoadingFailure(e.toString()));
    }
  }

  Future<void> _onGetAllProducts(
    GetAllProductsEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());
    try {
      final products = await _getAllProducts();
      emit(ProductsLoadingSuccess(categories: [], products: products));
    } catch (e) {
      emit(ProductsLoadingFailure(e.toString()));
    }
  }

  Future<void> _onGetProductsByCategory(
    GetProductsByCategoryEvent event,
    Emitter<ProductsState> emit,
  ) async {
    emit(ProductsLoading());
    try {
      final products = await _getProductsByCategory(event.category);
      emit(ProductsLoadingSuccess(categories: [], products: products));
    } catch (e) {
      emit(ProductsLoadingFailure(e.toString()));
    }
  }
}
