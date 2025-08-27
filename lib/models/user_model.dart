import 'dart:convert';

class UserModel {
  final int id;
  final String name;
  final String role; // "admin" | "maid" | "customer"

  UserModel({required this.id, required this.name, required this.role});

  factory UserModel.fromJson(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return UserModel(id: json['id'], name: json['name'], role: json['role']);
  }

  String toJson() {
    final Map<String, dynamic> data = {"id": id, "name": name, "role": role};
    return jsonEncode(data);
  }
}
