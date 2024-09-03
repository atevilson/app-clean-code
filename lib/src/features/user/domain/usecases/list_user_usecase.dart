
import 'dart:convert';

import 'package:clean_code_app/src/features/user/data/models/user.dart';
import 'package:http/http.dart' as http;

class ListUserUsecase {
  final http.Client httpClient;

  ListUserUsecase(this.httpClient);

  Future<List<User>> execute() async {
    final response = await httpClient.get(Uri.parse('http://192.168.201.6:5000/api/users'),
    );

    if (response.statusCode == 201) {

      final Map<String, dynamic> listEmpty = jsonDecode(response.body);
      final String msg = listEmpty['message'] ?? "Erro desconhecido";
      return throw Exception(msg);
      
    } else if (response.statusCode == 200) {

      final List<dynamic> usersJson = jsonDecode(response.body);
      return usersJson.map((json) => User.fromJson(json)).toList();

    } else {
      return throw Exception("Erro ao consultar contatos");
    }
  }
}