import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_app/features/products/presentation/blocs/products_bloc.dart';
import 'package:product_app/features/products/presentation/blocs/products_event.dart';
import 'package:product_app/features/products/presentation/blocs/products_state.dart';
import 'package:product_app/features/products/presentation/pages/products_page.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductsBloc()..add(GetAllCategoriesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 164, 194, 27),
        ),
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ProductsLoadingSuccess) {
              final categories = state.categories;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(
                              categories[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      ProductsPage(category: categories[index]),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.products.length,
                      itemBuilder: (context, index) {
                        final product = state.products[index];
                        return Card(
                          child: ListTile(
                            title: Text(product.title),
                            subtitle: Text('Rs.${product.price}'),
                            trailing: Image.network(
                              product.image,
                              width: 55,
                              height: 55,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is ProductsLoadingFailure) {
              return Center(child: Text(state.errorMessage));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
