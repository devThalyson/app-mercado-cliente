import 'package:app_mercado/controller/buys_controllers/buys_cart_controller/buys_cart_controller.dart';
import 'package:app_mercado/controller/buys_controllers/client_buys_controller/client_buys_controller.dart';
import 'package:app_mercado/custom_widgets/custom_buttons/custom_button.dart';
import 'package:app_mercado/custom_widgets/custom_buttons/custom_radio_button.dart';
import 'package:app_mercado/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado/custom_widgets/custom_text/custom_text_form.dart';
import 'package:app_mercado/model/produto.dart';
import 'package:app_mercado/utils/alert.dart';
import 'package:app_mercado/utils/convert_money.dart';
import 'package:app_mercado/utils/web_socket.dart';
import 'package:app_mercado/views/products_views/product_item_buy.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CartBuysView extends StatefulWidget {
  @override
  _CartBuysViewState createState() => _CartBuysViewState();
}

class _CartBuysViewState extends State<CartBuysView> {
  BuysCartController? _controllerView;

  @override
  Widget build(BuildContext context) {
    _controllerView = Provider.of<BuysCartController>(context);
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          texto: "Carrinho de compras",
          bold: true,
        ),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Observer(
      builder: (_) {
        return _controllerView!.products.length > 0
            ? _buyCartWithProducts()
            : _buyCartWithNoProducts();
      },
    );
  }

  _buyCartWithNoProducts() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Icon(
              Icons.add_shopping_cart,
              size: 80,
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: CustomText(
              texto: "Seu carrinho está vazio",
              tamanhoFonte: 20,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.all(20),
              child: CustomText(
                texto: "Clique aqui para adicionar produtos",
                tamanhoFonte: 20,
                cor: Colors.green[900],
                bold: true,
                underline: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buyCartWithProducts() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buyReceivement(),
          _buyList(),
          _paymentSelect(),
          _finishBuy(),
        ],
      ),
    );
  }

  _buyReceivement() {
    return Card(
      elevation: 10,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            child: CustomText(
              texto: "Como você deseja receber suas compras?",
              bold: true,
              tamanhoFonte: 16,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomRadioButton(
                "Receber em Casa",
                _controllerView!.radioReceiverBuy,
                0,
                _controllerView!.setRadioReceiverBuy,
              ),
              CustomRadioButton(
                "Retirar no Mercado",
                _controllerView!.radioReceiverBuy,
                1,
                _controllerView!.setRadioReceiverBuy,
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buyList() {
    return Card(
      elevation: 10,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  texto: "Sua lista de compras:",
                  tamanhoFonte: 16,
                  bold: true,
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete_forever,
                    color: Colors.green[900],
                  ),
                  onPressed: () {
                    Alert(
                      msg: "Tem certeza que deseja esvaziar o carrinho?",
                      okOrNot: true,
                      function: () {
                        _controllerView!.clearBuyCart();
                      },
                    ).showDialog(context);
                  },
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: _controllerView!.separatedProducts.length,
            itemBuilder: (context, index) {
              _controllerView!.separatedProducts.sort(
                (a, b) => a.nome!.compareTo(b.nome!),
              );
              Produto produto = _controllerView!.separatedProducts[index];

              return ProductItemBuy(produto);
            },
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15,
              right: 5,
              left: 5,
              bottom: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  texto: "Subtotal:",
                  tamanhoFonte: 16,
                ),
                CustomText(
                  texto: ConvertMoney().convertReal(
                    _controllerView!.subTotalPrice,
                  ),
                  tamanhoFonte: 16,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  texto: "Taxa de entrega:",
                  tamanhoFonte: 16,
                ),
                CustomText(
                  texto: ConvertMoney().convertReal(
                    _controllerView!.deliveryFee,
                  ),
                  tamanhoFonte: 16,
                  cor: Colors.green[900],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: Divider(
              color: Colors.black,
              height: 3,
            ),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  texto: "TOTAL:",
                  bold: true,
                  tamanhoFonte: 16,
                ),
                CustomText(
                  texto: ConvertMoney().convertReal(
                    _controllerView!.finalPrice,
                  ),
                  tamanhoFonte: 16,
                  bold: true,
                  cor: Colors.green[900],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _paymentSelect() {
    return Card(
      elevation: 10,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            child: CustomText(
              texto: "Escolha como vai pagar:",
              bold: true,
              tamanhoFonte: 16,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomRadioButton(
                "Dinheiro",
                _controllerView!.radioPaymentBuy,
                0,
                _controllerView!.setRadioPaymentBuy,
              ),
              CustomRadioButton(
                "Cartão de crédito",
                _controllerView!.radioPaymentBuy,
                1,
                _controllerView!.setRadioPaymentBuy,
              ),
              CustomRadioButton(
                "Cartão de débito",
                _controllerView!.radioPaymentBuy,
                2,
                _controllerView!.setRadioPaymentBuy,
              ),
            ],
          ),
          _controllerView!.radioPaymentBuy != 0
              ? Container(
                  margin: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(3),
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/images/cartao.png"),
                      ),
                      Container(
                        margin: EdgeInsets.all(3),
                        child: CustomText(
                          texto: "A máquininha vai ser levada na entrega!",
                          bold: true,
                          tamanhoFonte: 15,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(3),
                        height: 40,
                        width: 40,
                        child: Image.asset("assets/images/maquina.png"),
                      ),
                    ],
                  ),
                )
              : Container(
                  margin: EdgeInsets.all(10),
                  child: Form(
                    key: _controllerView!.formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 5,
                            bottom: 5,
                          ),
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            texto: "Com quanto você irá pagar?",
                            tamanhoFonte: 18,
                            bold: true,
                            cor: Colors.green[900],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: CustomText(
                            texto:
                                "De forma a calcular o troco precisamos dessa informação.",
                            tamanhoFonte: 16,
                          ),
                        ),
                        CustomTextForm(
                          dicaCampo: "R\$ 0,00",
                          controller: _controllerView!.controllerTextPayment,
                          tipoTeclado: TextInputType.number,
                          acaoTeclado: TextInputAction.done,
                          validator: _controllerView!.validatorTextPaymentValue,
                          icone: Icon(
                            Icons.attach_money_outlined,
                            color: Colors.green[900],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  _finishBuy() {
    return Container(
      margin: EdgeInsets.only(
        top: 6,
        left: 3,
        right: 3,
        bottom: 3,
      ),
      child: CustomButton(
        width: double.infinity,
        title: "COMPRAR",
        progress: _controllerView!.progress,
        function: () async {
          await _confirmeBuy();
        },
        buttonColor: Colors.green[900],
      ),
    );
  }

  _confirmeBuy() {
    return Alert(
      msg: "Confirmar compra?",
      okOrNot: true,
      function: () async {
        await _controllerView!.buyFunction();
        if (_controllerView!.formValidate == true) {
          Alert(
            msg: _controllerView!.mensage,
          ).showDialog(context);
          if (_controllerView!.mensage == "Compra realizada com sucesso!") {
            Provider.of<ClientBuysController>(context, listen: false)
                .getClientBuys();
            Provider.of<WebSocket>(context, listen: false)
                .channel
                .sink
                .add("Nova Compra");
          }
        }
      },
    ).showDialog(context);
  }
}
