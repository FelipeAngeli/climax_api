import 'dart:convert';

import 'package:http/http.dart' as http;

import 'http_client._contrato.dart';

//

class HttpPackageClient implements IhttpClient {
  @override
  Future<dynamic> get(String url) async {
    final response = await http.get(Uri.parse(url));
    return jsonDecode(response.body);
  }
}
