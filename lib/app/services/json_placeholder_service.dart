//service

import 'package:climax/app/model/todo_model.dart';

import 'http_client._contrato.dart';

// const url = "https://goweather.herokuapp.com/weather/parnaiba";

const url = "https://goweather.herokuapp.com/weather";

// class JsonPlaceholderService {
//   final IhttpClient client;

//   JsonPlaceholderService(this.client); //receber o dio vai construtor

//   Future<List<TodoModel>> getTodos(String cidade) async {
//     final response = await client.get("$url/$cidade");
//     final body = response as Map<String, dynamic>;
//     // final forecast = body["forecast"] as List; //para acesar a lista
//     // final todos =
//     //     forecast.map((todo) => TodoModel.fromJson(todo)).toList(); //cuidar 134

//     // return todos;
//   }
// }
