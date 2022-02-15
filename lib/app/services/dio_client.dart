import 'package:dio/dio.dart';

import 'http_client._contrato.dart';

//

class DioClient implements IhttpClient {
  final Dio dio = Dio();
  @override
  Future<dynamic> get(String url) async {
    final response = await dio.get(url);
    return response.data;
  }
}
