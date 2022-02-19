import 'package:climax/app/model/todo_model.dart';
import 'package:climax/app/services/http_client._contrato.dart';

// cuidar com os new
abstract class ProductRepositoryInterface {
  Future<List<TodoModel>> getProducts(String city);
}

class ProductRepository implements ProductRepositoryInterface {
  final IhttpClient client;

  ProductRepository(this.client);

  Future<List<TodoModel>> getProducts(String city) async {
    final response =
        await client.get("https://goweather.herokuapp.com/weather/$city");

    var list = response["forecast"];
    var products = List<TodoModel>.from(list.map((e) => TodoModel.fromJson(e)));

    return products;
  }
}
