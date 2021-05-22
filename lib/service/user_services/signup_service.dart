import 'package:app_mercado/utils/api_helper.dart';
import 'package:app_mercado/utils/api_response.dart';
import 'package:dbcrypt/dbcrypt.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class SignupService {
  static Future<ApiResponse<bool>> cadastro(
    String nome,
    String telefone,
    String email,
    String senha,
    String endereco,
  ) async {
    try {
      var stringUrl = ApiHelper().setUrl("clientes/cadastro");
      var url = Uri.parse(stringUrl);

      Map<String, String> headers = {"Content-Type": "application/json"};

      var hashSenha = DBCrypt().hashpw(senha, DBCrypt().gensalt());

      Map params = {
        "nome": nome,
        "telefone": telefone,
        "email": email,
        "endereco": endereco,
        "senha": hashSenha,
      };

      String body = convert.json.encode(params);

      var response = await http.post(url, body: body, headers: headers);

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      print("Hash: $hashSenha");

      if (response.statusCode == 201) {
        return ApiResponse.ok(true);
      }

      return ApiResponse.error("Esse email já esta cadastrado");
    } catch (error, exception) {
      print("Erro no cadastro $error > $exception");

      return ApiResponse.error("Erro no cadastro. Tente novamente!");
    }
  }
}
