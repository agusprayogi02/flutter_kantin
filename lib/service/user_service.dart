import 'package:flutter_kantin/model/user.dart';
import 'package:http/http.dart';

class UserApiService {
  final String baseUrl = "http://192.168.43.116/ci-kantin/public/index.php/";
  Client client = Client();

  Future<List<User>> getUser() async {
    final response = await client.get("$baseUrl/user");
    if (response.statusCode == 200) {
      return userFormJson(response.body);
    } else {
      return null;
    }
  }
}
