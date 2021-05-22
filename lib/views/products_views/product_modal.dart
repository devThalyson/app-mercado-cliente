import 'package:app_mercado/controller/buys_controllers/buys_cart_controller/buys_cart_controller.dart';
import 'package:app_mercado/custom_widgets/custom_buttons/custom_buy_button.dart';
import 'package:app_mercado/custom_widgets/custom_buttons/custom_soldoff_button.dart';
import 'package:app_mercado/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado/model/produto.dart';
import 'package:app_mercado/utils/convert_money.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ProductModal extends StatelessWidget {
  final Produto produto;

  ProductModal(this.produto);

  /// Snack-bar's criados par aparecer quando se adiciona ou
  /// remove um produto ///

  final snack1 = SnackBar(
    content: CustomText(
      texto: "Produto adicionado ao carrinho!",
      cor: Colors.white,
      bold: true,
    ),
    backgroundColor: Colors.green[900],
    duration: Duration(seconds: 1),
  );
  final snack2 = SnackBar(
    content: CustomText(
      texto: "Produto removido do carrinho!",
      cor: Colors.white,
      bold: true,
    ),
    backgroundColor: Colors.red[900],
    duration: Duration(seconds: 1),
  );

  /// Snack-bar's criados par aparecer quando se adiciona ou
  /// remove um produto ///

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 190,
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: Colors.black12,
                ),
                Container(
                  alignment: Alignment.center,
                  child: CachedNetworkImage(
                    imageUrl: produto.imagem!,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                alignment: Alignment.centerLeft,
                child: CustomText(
                  texto: produto.nome!,
                  tamanhoFonte: 16,
                  bold: true,
                ),
              ),
              CustomText(
                texto: "/",
              ),
              Container(
                margin: EdgeInsets.all(5),
                alignment: Alignment.centerLeft,
                child: CustomText(
                  texto: produto.peso.toString(),
                  bold: true,
                  tamanhoFonte: 16,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(5),
            alignment: Alignment.centerLeft,
            child: CustomText(
              texto: produto.descricao!,
              tamanhoFonte: 16,
            ),
          ),
          Container(
            height: 60,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green.shade900,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: CustomText(
                      texto: ConvertMoney().convertReal(produto.preco!),
                      tamanhoFonte: 21,
                      bold: true,
                    ),
                  ),
                ),
                produto.indisponivel == 0
                    ? Expanded(
                        child: Container(
                          height: double.infinity,
                          margin: EdgeInsets.all(5),
                          child: _buyButton(context),
                        ),
                      )
                    : Expanded(
                        child: Container(
                          height: double.infinity,
                          margin: EdgeInsets.all(5),
                          child: CustomSoldOffButton(
                            noMargin: true,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buyButton(BuildContext context) {
    return Observer(
      builder: (_) {
        return Provider.of<BuysCartController>(context)
                    .products
                    .contains(produto) ==
                false
            ? CustomBuyButton(
                noMargin: true,
                function: () {
                  Provider.of<BuysCartController>(context, listen: false)
                      .setProductInBuyCart(produto);
                  ScaffoldMessenger.of(context).showSnackBar(snack1);
                },
              )
            : CustomBuyButton(
                noMargin: true,
                removeProduct: true,
                function: () {
                  Provider.of<BuysCartController>(context, listen: false)
                      .removeProductOfBuyCart(produto);
                  ScaffoldMessenger.of(context).showSnackBar(snack2);
                },
              );
      },
    );
  }
}
