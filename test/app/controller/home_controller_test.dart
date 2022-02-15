// import 'package:climax/app/controller/home_controller.dart';
// import 'package:climax/app/model/todo_model.dart';
// import 'package:climax/app/services/json_placeholder_service.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// class JsonPlaceHolderServiceMock extends Mock
//     implements JsonPlaceholderService {}

// void main() {
//   test("deve preencher a lista corretamente", () async {
//     final service = JsonPlaceHolderServiceMock();
//     when(() => service.getTodos()).thenAnswer((_) async => [TodoModel.stub()]);
//     final controller = HomeController(service);
//     await controller.fetchAllTodos();
//     expect(controller.todos.length, 1);
//   });
// }
