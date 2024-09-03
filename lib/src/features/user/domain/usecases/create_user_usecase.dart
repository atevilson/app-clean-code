
import 'dart:convert';

import 'package:clean_code_app/src/features/user/data/models/user.dart';
import 'package:http/http.dart' as http;

class CreateUserUsecase {
  final http.Client httpClient;

  CreateUserUsecase(this.httpClient);
  
  Future<User> execute({required String name, required String email, required String phone}) async {
    final response = await httpClient.post(

      Uri.parse('http://192.168.201.6:5000/api/users'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
        {'name': name, 'email': email, 'phone': phone},
      ),
    );

    if (response.statusCode == 200) {

      final user = jsonDecode(response.body);
      return User.fromJson(user);

    } else if (response.statusCode == 400) {
      
      final Map<String, dynamic> errorResponse = jsonDecode(response.body);
      final String errorMessage = errorResponse['erro'] ?? "Erro desconhecido";
      return throw Exception(errorMessage);

    } else {

      return throw Exception("Falha ao criar contato");
    
    }
  }
}