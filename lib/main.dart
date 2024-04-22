import 'package:flutter/material.dart';
import 'package:product_app/core/services/service_locator.dart';
import 'package:product_app/features/products/presentation/pages/categories_page.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CategoriesPage(),
    );
  }
}
