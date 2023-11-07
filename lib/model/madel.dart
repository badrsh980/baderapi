class ObjectModel {
  final String id;
  final String name;
  final Map<String, dynamic>? data;
  String? createdAt;

  ObjectModel({
    this.createdAt,
    required this.id,
    required this.name,
    this.data,
  });

  factory ObjectModel.fromJson(Map<String, dynamic> json) {
    return ObjectModel(
      id: json['id'],
      name: json['name'],
      createdAt: json['createdAt'],
      data:
          json['data'] != null ? Map<String, dynamic>.from(json['data']) : null,
    );
  }
}
