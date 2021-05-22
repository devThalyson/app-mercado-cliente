import 'package:app_mercado/model/compra.dart';
import 'package:app_mercado/model/produto.dart';
import 'package:app_mercado/service/buys_services/buys_services.dart';
import 'package:app_mercado/utils/api_response.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'buys_cart_controller.g.dart';

class BuysCartController = _BuysCartControllerBase with _$BuysCartController;

abstract class _BuysCartControllerBase with Store {
  ////// INICIO - Observables //////

  @observable
  int radioReceiverBuy = 0;

  @observable
  int radioPaymentBuy = 0;

  // Controlador do valor que o usuário vai usar
  // para pagar a conta (Caso pague em dinheiro)
  @observable
  TextEditingController controllerTextPayment = TextEditingController();

  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  List<Produto> products = ObservableList<Produto>();

  @observable
  List<Produto> separatedProducts = ObservableList<Produto>();

  @observable
  double subTotalPrice = 0;

  @observable
  double deliveryFee = 0;

  @observable
  double finalPrice = 0;

  @observable
  bool progress = false;

  @observable
  String mensage = "";

  @observable
  bool? formValidate;

  ////// FIM - Observables //////

  ////// INICIO - Actions //////
  @action
  setRadioReceiverBuy(int value) {
    radioReceiverBuy = value;
  }

  @action
  setRadioPaymentBuy(int value) {
    radioPaymentBuy = value;
    controllerTextPayment.text = "";
  }

  @action
  setProductInBuyCart(Produto produto) {
    products.add(produto);
    setSeparetedProducts();
    setFinalPrice();
  }

  @action
  removeProductOfBuyCart(Produto produto) {
    products.removeWhere(
      (element) => element.id == produto.id,
    );
    setSeparetedProducts();
    setFinalPrice();
  }

  @action
  removeProductOneAOne(Produto produto) {
    products.remove(produto);
    setSeparetedProducts();
    setFinalPrice();
  }

  @action
  clearBuyCart() {
    products.clear();
    setSeparetedProducts();
    setFinalPrice();
  }

  /// Método que checa quantos produtos repetidos estão na lista de
  /// compras
  @action
  checkQuantityOfProductInBuyCart(Produto produto) {
    int quantityProductsRepeteads = products
        .map((element) => element.id == produto.id ? 1 : 0)
        .reduce((value, element) => value + element);

    print(quantityProductsRepeteads);
  }

  @action
  setSeparetedProducts() {
    /// Variavel que vai ser usada pra comparar os ids dos produtos da lista
    /// de compras.
    final existingProducts = Set<int>();

    /// Lista sem produtos duplicadas que vai ser exibida no carrinho de
    /// compras!
    separatedProducts =
        products.where((produto) => existingProducts.add(produto.id!)).toList();
  }

  @action
  setFinalPrice() {
    subTotalPrice = products.isNotEmpty
        ? products.map<double>((m) => m.preco!).reduce((a, b) => a + b)
        : 0;
    finalPrice = subTotalPrice + deliveryFee;
  }

  @action
  buyFunction() async {
    // Criando um novo objeto de compra
    Compra compra = Compra();

    // Setando modo de recebimento e forma de pagamento da compra
    compra.recebimento = catchReceiverBuy();
    compra.formaDePagamento = catchPaymentBuy();

    // A compra vai ser criada com status de Pendente
    compra.status = "Pendente";

    // Setando dados financeiros da compra (Troco, Preço final e taxa
    // de entrega)
    compra.taxaDeEntrega = deliveryFee;
    compra.preco = finalPrice;

    // Pegando valor do controlador do campo de pagamento e convertendo
    // para double.
    double valuePayment = controllerTextPayment.text.isNotEmpty
        ? double.parse(controllerTextPayment.text)
        : 0;
    compra.troco = valuePayment > 0 ? valuePayment - finalPrice : 0;

    // Pegando a data e hora do momento da compra
    compra.dataDeCompra = DateTime.now().toIso8601String();

    // Por fim, a compra recebe a lista de produtos adicionados pelo
    // Usuário
    compra.produtos = products;

    if (radioPaymentBuy == 0) {
      if (!formKey.currentState!.validate()) {
        formValidate = false;
        return;
      }
      formValidate = true;
      progress = true;
      ApiResponse response = await BuysServices.postBuy(compra);
      if (response.ok == true) {
        mensage = "Compra realizada com sucesso!";
        clearBuyCart();
        controllerTextPayment.text = "";
      } else {
        mensage = response.msg!;
      }
      progress = false;
    } else {
      formValidate = true;
      progress = true;
      ApiResponse response = await BuysServices.postBuy(compra);
      if (response.ok == true) {
        mensage = "Compra realizada com sucesso!";
        clearBuyCart();
        controllerTextPayment.text = "";
      } else {
        mensage = response.msg!;
      }
      progress = false;
    }
  }

  ////// FIM - Actions //////

  ////// INICIO - Validators //////
  String? validatorTextPaymentValue(String? txt) {
    if (txt!.isEmpty || txt.length < 2) {
      return "Preencha esse campo corretamente!";
    }
  }
  ////// FIM - Validators //////

  ///// INICIO - Switchs //////
  catchReceiverBuy() {
    switch (radioReceiverBuy) {
      case 0:
        return "Receber em casa";
      case 1:
        return "Retirar no mercado";
    }
  }

  catchPaymentBuy() {
    switch (radioPaymentBuy) {
      case 0:
        return "Dinheiro";
      case 1:
        return "Cartão de crédito";
      case 2:
        return "Cartão de débito";
    }
  }
  ///// FIM - Switchs //////
}
