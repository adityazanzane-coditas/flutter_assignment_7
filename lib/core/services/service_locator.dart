import 'package:get_it/get_it.dart';
import 'package:product_app/core/services/api_service.dart';
import 'package:product_app/features/products/data/datasources/product_remote_data_source.dart';
import 'package:product_app/features/products/data/repositories/product_repository_impl.dart';
import 'package:product_app/features/products/domain/repositories/product_repository.dart';
import 'package:product_app/features/products/domain/usecases/get_all_categories.dart';
import 'package:product_app/features/products/domain/usecases/get_all_products.dart';
import 'package:product_app/features/products/domain/usecases/get_products_by_category.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Register services
  getIt.registerLazySingleton<ApiService>(() => ApiService());

  // Register data sources
  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSource(getIt()),
  );

  // Register repositories
  getIt.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(getIt()),
  );

  // Register use cases
  getIt.registerLazySingleton<GetAllCategories>(
    () => GetAllCategories(getIt()),
  );
  getIt.registerLazySingleton<GetAllProducts>(
    () => GetAllProducts(getIt()),
  );
  getIt.registerLazySingleton<GetProductsByCategory>(
    () => GetProductsByCategory(getIt()),
  );
}
