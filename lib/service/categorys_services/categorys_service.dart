import 'package:app_mercado/model/categoria.dart';
import 'package:app_mercado/model/cliente.dart';
import 'package:app_mercado/utils/api_helper.dart';
import 'package:app_mercado/utils/api_response.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class CategorysService {
  static Future<ApiResponse<Categoria>> getCategoria(int id) async {
    try {
      Cliente cliente = (await Cliente.get())!;

      String stringUrl = ApiHelper().setUrl("categorias/$id");
      var url = Uri.parse(stringUrl);

      Map<String, String> headers = ApiHelper().setHeaders(cliente.token!);

      var response = await http.get(url, headers: headers);

      Map<String, dynamic> mapResponse = convert.json.decode(response.body);

      final categoria = Categoria.fromJson(mapResponse);

      return ApiResponse.ok(categoria);
    } catch (error) {
      print(error);
      return ApiResponse.error("Erro ao carregar produtos");
    }
  }

    static Future<ApiResponse<List<Categoria>>> getCategorys() async {
    try {
      Cliente cliente = (await Cliente.get())!;

      String stringUrl = ApiHelper().setUrl("categorias");
      var url = Uri.parse(stringUrl);

      Map<String, String> headers = ApiHelper().setHeaders(cliente.token!);

      var response = await http.get(url, headers: headers);

      List listResponse = convert.json.decode(response.body);

      final List<Categoria> categorias = [];

      for (Map<String, dynamic> map in listResponse) {
        Categoria categoria = Categoria.fromJson(map);
        categorias.add(categoria);
      }
      return ApiResponse.ok(categorias);
    } catch (error) {
      print(error);
      return ApiResponse.error("Erro ao carregar produtos.");
    }
  }
}
