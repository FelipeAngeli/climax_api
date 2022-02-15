// import 'dart:convert';

// import 'package:climax/app/services/http_client._contrato.dart';
// import 'package:climax/app/services/json_placeholder_service.dart';

// import 'package:dio/native_imp.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:http/http.dart';
// import 'package:mocktail/mocktail.dart';

// class DioMock extends Mock implements DioForNative {}

// class IhttpClientMock extends Mock implements IhttpClient {}

// void main() async {
//   test("deve retornar o que for pedido", () async {
//     final client = IhttpClientMock();

//     when(() => client.get(url))
//         .thenAnswer((_) async => jsonDecode(jsonResponse));
//     final service = JsonPlaceholderService(client); //desacoplamento
//     final todos = await service.getTodos();
//     expect(todos[1].temperature, "30 °C");
//   });
// }

// const jsonResponse =
//     r'''{
// "temperature": "+31 °C",
// "wind": "30 km/h",
// "description": "Partly cloudy",
// "forecast": [
// {
// "day": "1",
// "temperature": "+30 °C",
// "wind": "23 km/h"
// },
// {
// "day": "2",
// "temperature": "30 °C",
// "wind": "21 km/h"
// },
// {
// "day": "3",
// "temperature": " °C",
// "wind": "15 km/h"
// }
// ]
// } ''';



// final response = Response(
//         //faz o response para o json response
//         requestOptions: RequestOptions(
//           path: "",
//         ),
//         data: jsonDecode(jsonResponse),
//         statusCode: 200);