import 'package:climax/app/controller/home_controller.dart';
import 'package:climax/app/services/dio_client.dart';
import 'package:climax/app/services/json_placeholder_service.dart';
import 'package:flutter/material.dart';
//https://www.youtube.com/watch?v=y_HpEEYatro

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
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextFormField(
                    controller: controller.cidadeController,
                    decoration: InputDecoration(
                        labelText: "Digite sua cidade",
                        labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        alignLabelWithHint: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(width: 3, color: Colors.blue),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(15),
                        ))),
              ),
              SizedBox(
                width: 250,
                height: 55,
                child: ElevatedButton(
                  onPressed: () async {
                    await controller.fetchAllTodos();
                  },
                  child: const Text(
                    "Consultar",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 400,
                child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, _) {
                      return ListView.builder(
                          itemCount: controller.todos.length,
                          itemBuilder: (context, index) {
                            final todo = controller.todos[index];

                            return ListTile(
                                title: Column(
                              children: [
                                const SizedBox(height: 10),
                                Text("Dia " + todo.day),
                                Text("Temperatura " + todo.temperature),
                                Text("Vento " + todo.wind),
                              ],
                            ));
                          });
                    }),
              ),
            ],
          ),
        ));
  }
}





// AnimatedBuilder(
//           // ouve o notifyListeners
//           animation: controller,
//           builder: (context, widget) {
//             return Column(
//               children: [
//                 TextFormField(
//                   controller: controller.cidadeController,
//                   onFieldSubmitted: (value) {
//                     controller.fetchAllTodos();
//                   },
//                 ),
//                 SizedBox(
//                   height: 400,
//                   child: ListView.builder(
//                       itemCount: controller.todos.length,
//                       itemBuilder: (context, index) {
//                         final todo = controller.todos[index];
//                         return ListTile(
//                             title: Column(
//                           children: [
//                             Text(todo.day),
//                             Text(todo.temperature),
//                             Text(todo.wind),
//                           ],
//                         ));
//                       }),
//                 ),
//               ],
//             );
//           },
//         )