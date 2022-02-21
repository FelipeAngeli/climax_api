import 'package:climax/app/model/weather_model.dart';

class ProductState {
  const ProductState();
}

class EmptyProductState extends ProductState {}

class LoadingProductState extends ProductState {}

class ErrorProductState extends ProductState {
  final String message;

  const ErrorProductState(this.message);
}

class SuccessProductState extends ProductState {
  final List<TodoModel> products;

  const SuccessProductState(this.products);
}
