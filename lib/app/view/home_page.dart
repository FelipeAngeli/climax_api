import 'package:climax/app/bloc/home_bloc.dart';
import 'package:climax/app/bloc/product_events.dart';
import 'package:climax/app/bloc/product_state.dart';
import 'package:climax/app/controller/home_controller.dart';
import 'package:climax/app/repository/product_repository.dart';
import 'package:climax/app/services/dio_client.dart';
import 'package:climax/app/services/json_placeholder_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  late HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = HomeBloc(ProductRepository(DioClient()));
    bloc.add(FetchWeatherEvent("Agudo"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Clima"),
        ),
        body: Center(
          child: Column(
            children: [
              Image.asset(
                'assets/image/fundo.png',
                width: 250,
                height: 250,
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextFormField(
                    controller: controller.cidadeController,
                    decoration: InputDecoration(
                        labelText: "Digite sua cidade",
                        labelStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        alignLabelWithHint: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Color(0xff595FFB)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3, color: Color(0xff595FFB)),
                          borderRadius: BorderRadius.circular(15),
                        ))),
              ),
              SizedBox(
                width: 250,
                height: 55,
                child: ElevatedButton(
                  onPressed: () async {
                    bloc.add(
                        FetchWeatherEvent(controller.cidadeController.text));
                  },
                  child: const Text(
                    "Consultar",
                    style: TextStyle(fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xffFE7062),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 400,
                child: BlocBuilder<HomeBloc, ProductState>(
                    bloc: bloc,
                    builder: (context, state) {
                      if (state is LoadingProductState) {
                        return Center(
                          child: CircularProgressIndicator(), //posso editar
                        );
                      }
                      if (state is ErrorProductState) {
                        return Center(
                          child: Text(state.message),
                        );
                      }
                      if (state is EmptyProductState) {
                        return Center(
                          child: Text("Nem um clima encontrado"),
                        );
                      }
                      state as SuccessProductState;
                      return ListView.builder(
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            final todo = state.products[index];

                            return ListTile(
                                title: Column(
                              children: [
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Image.asset(
                                          "assets/icons/calendario.png",
                                          width: 20),
                                    ),
                                    Text("Dia " + todo.day),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Image.asset(
                                          "assets/icons/temperatura.png",
                                          width: 20),
                                    ),
                                    Text("Temperatura " + todo.temperature),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Image.asset(
                                          "assets/icons/wind.png",
                                          width: 20),
                                    ),
                                    Text("Vento " + todo.wind),
                                  ],
                                ),
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
