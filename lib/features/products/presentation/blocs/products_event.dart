abstract class ProductsEvent {}

class GetAllCategoriesEvent extends ProductsEvent {}

class GetAllProductsEvent extends ProductsEvent {}

class GetProductsByCategoryEvent extends ProductsEvent {
  final String category;

  GetProductsByCategoryEvent(this.category);
}
