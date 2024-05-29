import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:visit_nepal/model/data_model.dart';

class ApiData {
  String baseUrl = "https://jsonplaceholder.typicode.com/comments";

  Future<List<ModelPlaces>> getData() async {
    http.Response res = await http.get(Uri.parse(baseUrl));
    if (res.statusCode == 200) {
      List<dynamic> list = jsonDecode(res.body);

      return list.map((e) => ModelPlaces.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
