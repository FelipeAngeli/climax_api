import 'package:bloc/bloc.dart';
import 'package:climax/app/bloc/product_events.dart';
import 'package:climax/app/bloc/product_state.dart';
import 'package:climax/app/repository/product_repository.dart';

class HomeBloc extends Bloc<WeatherEvent, ProductState> {
  final ProductRepositoryInterface repository;
  HomeBloc(this.repository) : super(EmptyProductState()) {
    on<FetchWeatherEvent>(_fetchProducts);
  }

  Future<void> _fetchProducts(
      FetchWeatherEvent events, Emitter<ProductState> emit) async {
    emit(LoadingProductState());
    try {
      final weather = await repository.getProducts(events.city);
      emit(SuccessProductState(weather));
    } catch (e) {
      emit(ErrorProductState(e.toString()));
    }
  }
}
