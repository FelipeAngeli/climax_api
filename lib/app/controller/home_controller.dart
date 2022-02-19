import 'package:climax/app/model/todo_model.dart';
import 'package:climax/app/repository/product_repository.dart';

import 'package:flutter/cupertino.dart';

//chagenotifier reatividade
//aqui colocamos se for dio ou http
//notifyListeners vem do ChangeNotifier e faz a notificação os ouvintes
class HomeController extends ChangeNotifier {
  // quando o teste acaba, ele preenche o estado

  TextEditingController cidadeController = TextEditingController();
}
