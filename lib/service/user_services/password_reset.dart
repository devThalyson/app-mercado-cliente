import 'package:app_mercado/utils/api_response.dart';
import 'package:http/http.dart' as http;

class PasswordReset {
  static Future<ApiResponse<bool>> resetPassword(String email) async {
    try {
      var stringUrl = "http://ip-local-host:8080/forgot_password/$email";
      var url = Uri.parse(stringUrl);

      Map<String, String> headers = {"Content-Type": "application/json"};

      var response = await http.post(url, headers: headers);

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200) {
        return ApiResponse.ok(true);
      }

      return ApiResponse.error("Erro. Tente novamente!");
    } catch (error, exception) {
      print("$error > $exception");

      return ApiResponse.error("Erro. Tente novamente!");
    }
  }
}
