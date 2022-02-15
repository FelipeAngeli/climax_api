import 'package:climax/app/controller/home_controller.dart';
import 'package:climax/app/services/dio_client.dart';
import 'package:climax/app/services/json_placeholder_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController(JsonPlaceholderService(DioClient()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Clima"),
        ),
        body: AnimatedBuilder(
          // ouve o notifyListeners
          animation: controller,
          builder: (context, widget) {
            return Column(
              children: [
                TextFormField(
                  controller: controller.cidadeController,
                  onFieldSubmitted: (value) {
                    controller.fetchAllTodos();
                  },
                ),
                SizedBox(
                  height: 400,
                  child: ListView.builder(
                      itemCount: controller.todos.length,
                      itemBuilder: (context, index) {
                        final todo = controller.todos[index];
                        return ListTile(
                            title: Column(
                          children: [
                            Text(todo.day),
                            Text(todo.temperature),
                            Text(todo.wind),
                          ],
                        ));
                      }),
                ),
              ],
            );
          },
        ));
  }
}
