import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../product_bloc.dart';
import '../product_state.dart';


class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Product')),
      body: Center(
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return CircularProgressIndicator();
            } else if (state is ProductLoaded) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ListTile(
                    title: Text(product.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('₹ ${product.price}'),
                        if (product.color != null)
                          Text('Color: ${product.color}'),
                      ],
                    ),
                  );
                },
              );
            } else if (state is ProductError) {
              return Text('Error: ${state.errormessage}');
            }
            return Text('Press button to fetch product');
          },
        ),
      ),
    );
  }
}
