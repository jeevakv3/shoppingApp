import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  String baseUrl = 'https://work.kannathal.com/Sheela/Eqs/';

  //var headers = {'Content-Type': 'application/json'};

  Future<dynamic> postData(queryParam, endpoint) async {
    try {
      var response =
          await http.post(Uri.parse(baseUrl + endpoint), body: queryParam);
      if (response.statusCode == 200) {
        print(response.body);
        return jsonDecode(response.body);
      }
    } catch (e) {
      print('Api Exception $e');
    }
  }
}
