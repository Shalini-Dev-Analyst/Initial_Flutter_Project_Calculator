import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Api Services/product_repositories.dart';
import 'View/Products/Screens/ProductPage.dart';
import 'View/Products/product_bloc.dart';
import 'View/Products/product_event.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ProductRepository repository = ProductRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => ProductBloc(repository)..add(LoadProduct()),
        child: ProductPage(),
      ),
    );
  }
}

