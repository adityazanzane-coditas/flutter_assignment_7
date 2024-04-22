import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> getAllCategories() async {
    Response response;
    try {
      response = await _dio.get('https://fakestoreapi.com/products/categories');
    } catch (e) {
      throw Exception('Could not fetch products');
    }
    return response;
  }

  Future<Response> getProductsByCategory(String category) async {
    try {
      return await _dio
          .get('https://fakestoreapi.com/products/category/$category');
    } catch (e) {
      throw Exception('Could not fetch category');
    }
  }

  Future<Response> getAllProducts() async {
    Response response;
    try {
      response = await _dio.get('https://fakestoreapi.com/products');
    } catch (e) {
      throw Exception('Could not fetch all products');
    }
    return response;
  }
}
