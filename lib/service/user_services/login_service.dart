import 'package:app_mercado/model/cliente.dart';
import 'package:app_mercado/utils/api_helper.dart';
import 'package:app_mercado/utils/api_response.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class LoginService {
  static Future<ApiResponse<bool>> login(String email, String senha) async {
    try {
      var stringUrl = ApiHelper().setUrl("login");

      var url = Uri.parse(stringUrl);

      Map<String, String> headers = {"Content-Type": "application/json"};

      Map params = {
        "username": email,
        "password": senha,
      };

      String body = convert.json.encode(params);

      var response = await http.post(url, body: body, headers: headers);

      Map<String, dynamic> mapResponse = convert.json.decode(response.body);

      if (response.statusCode == 200) {
        final cliente = Cliente.fromJson(mapResponse);

        cliente.save();

        return ApiResponse.ok(true);
      }
      return ApiResponse.error("E-mail ou senha incorretos");
    } catch (error, exception) {
      print("erro no login $error > $exception");

      return ApiResponse.error("Não foi possível fazer o login");
    }
  }
}
