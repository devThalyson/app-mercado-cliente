import 'package:app_mercado/controller/buys_controllers/buys_cart_controller/buys_cart_controller.dart';
import 'package:app_mercado/custom_widgets/custom_buttons/custom_buy_button.dart';
import 'package:app_mercado/custom_widgets/custom_buttons/custom_soldoff_button.dart';
import 'package:app_mercado/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado/model/produto.dart';
import 'package:app_mercado/utils/convert_money.dart';
import 'package:app_mercado/views/products_views/product_modal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Produto produto;

  ProductCard(this.produto);

  /// Snack-bar's criados par aparecer quando se adiciona ou
  /// remove um produto ///

  final snack1 = SnackBar(
    content: CustomText(
      texto: "Produto adicionado ao carrinho!",
      cor: Colors.white,
      bold: true,
    ),
    backgroundColor: Colors.green[900],
    duration: Duration(milliseconds: 400),
  );
  final snack2 = SnackBar(
    content: CustomText(
      texto: "Produto removido do carrinho!",
      cor: Colors.white,
      bold: true,
    ),
    backgroundColor: Colors.red[900],
    duration: Duration(milliseconds: 400),
  );

  /// Snack-bar's criados par aparecer quando se adiciona ou
  /// remove um produto ///

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.only(
          top: 3,
          left: 2,
          right: 2,
          bottom: 0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomText(
              texto: "${produto.nome} - ${produto.peso}",
              bold: true,
              maxLines: 2,
              overFlow: true,
              tamanhoFonte: 15,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return ProductModal(produto);
                  },
                );
              },
              child: Container(
                height: 100,
                width: 100,
                padding: EdgeInsets.only(
                  left: 3,
                  right: 3,
                ),
                child: CachedNetworkImage(
                  imageUrl: produto.imagem!,
                  placeholder: (_, url) => Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.green[900],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(
                left: 2,
              ),
              child: CustomText(
                texto: ConvertMoney().convertReal(produto.preco!),
                bold: true,
                tamanhoFonte: 17,
              ),
            ),
            produto.indisponivel == 0
                ? _buyButton(context)
                : CustomSoldOffButton(),
          ],
        ),
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
                function: () {
                  Provider.of<BuysCartController>(context, listen: false)
                      .setProductInBuyCart(produto);
                  ScaffoldMessenger.of(context).showSnackBar(snack1);
                },
              )
            : CustomBuyButton(
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
