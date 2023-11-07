import 'package:api/model/madel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ObjectApi {
  static Future<List<ObjectModel>> fetchObjects() async {
    final response =
        await http.get(Uri.parse("https://api.restful-api.dev/objects"));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      List<ObjectModel> objects =
          jsonData.map((json) => ObjectModel.fromJson(json)).toList();
      return objects;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class ObjectCreateApi {
  static Future<ObjectModel> createObject(ObjectModel newObject) async {
    final response = await http.post(
      Uri.parse("https://api.restful-api.dev/objects"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(newObject),
    );

    if (response.statusCode == 201) {
      return ObjectModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create object');
    }
  }
}
