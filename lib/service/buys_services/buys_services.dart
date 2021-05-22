import 'package:app_mercado/model/cliente.dart';
import 'package:app_mercado/model/compra.dart';
import 'package:app_mercado/utils/api_helper.dart';
import 'package:app_mercado/utils/api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BuysServices {
  static Future<ApiResponse<bool>> postBuy(Compra compra) async {
    try {
      Cliente cliente = (await Cliente.get())!;

      compra.cliente = cliente;

      String stringUrl = ApiHelper().setUrl("compras");
      var url = Uri.parse(stringUrl);

      Map<String, String> headers = ApiHelper().setHeaders(cliente.token!);

      String body = compra.jsonFormat();

      var response = await http.post(url, body: body, headers: headers);

      print("Response status: ${response.statusCode}");

      if (response.statusCode == 201) {
        return ApiResponse.ok(true);
      }

      return ApiResponse.error("Erro ao finalizar compra. Tente novamente!");
    } catch (error, exception) {
      print("Erro  $error > $exception");

      return ApiResponse.error("Erro ao finalizar compra. Tente novamente!");
    }
  }

  static Future<ApiResponse<List<Compra>>> getBuysByClient() async {
    try {
      Cliente cliente = (await Cliente.get())!;

      String stringUrl = ApiHelper().setUrl("compras/cliente/${cliente.id}");
      var url = Uri.parse(stringUrl);

      Map<String, String> headers = ApiHelper().setHeaders(cliente.token!);

      var response = await http.get(url, headers: headers);

      List listResponse = convert.json.decode(response.body);

      final List<Compra> compras = [];

      for (Map<String, dynamic> map in listResponse) {
        Compra compra = Compra.fromJson(map);
        compras.add(compra);
      }
      return ApiResponse.ok(compras);
    } catch (error) {
      print(error);
      return ApiResponse.error("Erro ao carregar suas compras.");
    }
  }
}
