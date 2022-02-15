import 'package:climax/app/model/todo_model.dart';
import 'package:climax/app/services/dio_client.dart';
import 'package:climax/app/services/json_placeholder_service.dart';
import 'package:flutter/cupertino.dart';

//chagenotifier reatividade
//aqui colocamos se for dio ou http
//notifyListeners vem do ChangeNotifier e faz a notificação os ouvintes
class HomeController extends ChangeNotifier {
  final JsonPlaceholderService _service;
  // quando o teste acaba, ele preenche o estado
  var todos = <TodoModel>[];

  HomeController(this._service); //construtor
  TextEditingController cidadeController = TextEditingController();

  Future<void> fetchAllTodos() async {
    todos = await _service.getTodos(cidadeController.value.text);
    notifyListeners();
  }
}
