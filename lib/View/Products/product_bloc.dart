import 'package:api_integration_using_bloc/View/Products/product_event.dart';
import 'package:api_integration_using_bloc/View/Products/product_state.dart';
import '../../Api Services/product_repositories.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductBloc extends Bloc<ProductEvent,ProductState>{
  final ProductRepository repository;

  ProductBloc(this.repository) : super(ProductInitial()) {
    on<LoadProduct>((event, emit) async {
      emit(ProductLoading());
      try {
        final product = await repository.fetchProduct();
        emit(ProductLoaded(product));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}