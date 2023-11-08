import 'package:http/http.dart' as http;
import 'dart:convert';

class Phone {
  final String id;
  final String name;
  final Map<String, dynamic>? data;
  String? createdAt;

  Phone({
    this.createdAt,
    required this.id,
    required this.name,
    this.data,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'name': name,
      'createdAt': createdAt,
    };
    if (this.data != null) {
      data['data'] = this.data;
    }
    return data;
  }

  factory Phone.fromJson(Map<String, dynamic> json) {
    return Phone(
      id: json['id'],
      name: json['name'],
      createdAt: json['createdAt'],
      data:
          json['data'] != null ? Map<String, dynamic>.from(json['data']) : null,
    );
  }
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
  ///get
  static Future<List<Phone>> getPhone() async {
    final response =
        await http.get(Uri.parse("https://api.restful-api.dev/objects"));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      List<Phone> objects =
          jsonData.map((json) => Phone.fromJson(json)).toList();
      return objects;
    } else {
      throw Exception('Failed to load data');
    }
  }

//////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////
  ///post
  static Future<Phone> postNewPhone(Phone newPhone) async {
    final response = await http.post(
      Uri.parse("https://api.restful-api.dev/objects"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(newPhone),
    );
    if (response.statusCode == 200) {
      return Phone.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create object');
    }
  }

///////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////
  static Future<Phone> createPhone({
    String name = '',
    int year = 0,
    double price = 0,
    String cpuModel = "",
    String hardDiskSize = "",
  }) async {
    final newPhone = Phone(
      id: '0',
      name: name,
      data: {
        'year': year,
        'price': price,
        'CPU model': cpuModel,
        'Hard disk size': hardDiskSize,
      },
      createdAt: '',
    );
    try {
      final createdPhone = await postNewPhone(newPhone);
      return createdPhone;
    } catch (e) {
      throw Exception('Failed to create phone: $e');
    }
  }
}
