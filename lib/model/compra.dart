import 'package:app_mercado/model/cliente.dart';
import 'package:app_mercado/model/produto.dart';
import 'dart:convert' as convert;

class Compra {
  int? id;
  String? status;
  String? recebimento;
  String? formaDePagamento;
  String? motivoRejeicao;
  double? preco;
  double? taxaDeEntrega;
  double? troco;
  String? dataDeCompra;
  List<Produto>? produtos;
  Cliente? cliente;

  Compra(
      {this.id,
      this.status,
      this.recebimento,
      this.formaDePagamento,
      this.preco,
      this.taxaDeEntrega,
      this.troco,
      this.dataDeCompra,
      this.produtos,
      this.cliente});

  Compra.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    recebimento = json['recebimento'];
    formaDePagamento = json['formaDePagamento'];
    motivoRejeicao = json['motivoRejeicao'];
    preco = json['preco'];
    taxaDeEntrega = json['taxaDeEntrega'];
    troco = json['troco'];
    dataDeCompra = json['dataDeCompra'];
    if (json['produtos'] != null) {
      produtos = [];
      json['produtos'].forEach((v) {
        produtos!.add(new Produto.fromJson(v));
      });
    }
    cliente =
        json['cliente'] != null ? new Cliente.fromJson(json['cliente']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['recebimento'] = this.recebimento;
    data['motivoRejeicao'] = this.motivoRejeicao;
    data['formaDePagamento'] = this.formaDePagamento;
    data['preco'] = this.preco;
    data['taxaDeEntrega'] = this.taxaDeEntrega;
    data['troco'] = this.troco;
    data['dataDeCompra'] = this.dataDeCompra;
    if (this.produtos != null) {
      data['produtos'] = this.produtos!.map((v) => v.toJson()).toList();
    }
    if (this.cliente != null) {
      data['cliente'] = this.cliente!.toJson();
    }
    return data;
  }

  String jsonFormat() {
    String json = convert.json.encode(toJson());
    return json;
  }
}
