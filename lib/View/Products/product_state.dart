import 'package:equatable/equatable.dart';
import '../../Models/product_model.dart';

abstract class ProductState extends Equatable {
  const ProductState();
  @override
  List<Object> get props => [];
}

class ProductInitial extends ProductState {}
class ProductLoading extends ProductState {}
class ProductLoaded extends ProductState {
  final List<Product> products;
  const ProductLoaded(this.products);
}
class ProductError extends ProductState {
  final String errormessage;
  const ProductError(this.errormessage);
  @override
  List<Object>get props =>[errormessage];
}
