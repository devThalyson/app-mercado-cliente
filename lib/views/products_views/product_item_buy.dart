import 'package:app_mercado/controller/buys_controllers/buys_cart_controller/buys_cart_controller.dart';
import 'package:app_mercado/custom_widgets/custom_buttons/custom_list_buy_button.dart';
import 'package:app_mercado/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado/model/produto.dart';
import 'package:app_mercado/utils/convert_money.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItemBuy extends StatelessWidget {
  final Produto produto;

  ProductItemBuy(this.produto);

  @override
  Widget build(BuildContext context) {
    final int quantityOfProduct = Provider.of<BuysCartController>(context)
        .products
        .map((element) => element.id == produto.id ? 1 : 0)
        .reduce((value, element) => value + element);

    double priceXQuantityOfProduct = produto.preco! * quantityOfProduct;

    return Container(
      margin: EdgeInsets.all(3),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.only(
                  right: 4,
                ),
                child: CachedNetworkImage(
                  imageUrl: produto.imagem!,
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      texto: "${produto.nome}  -  ${produto.peso}",
                      bold: true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 3,
                          ),
                          child: CustomText(
                            texto: ConvertMoney().convertReal(produto.preco!),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 3,
                          ),
                          child: CustomText(
                            texto: ConvertMoney()
                                .convertReal(priceXQuantityOfProduct),
                            cor: Colors.green[900],
                            bold: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              CustomListBuyButton(produto)
            ],
          ),
          Container(
            margin: EdgeInsets.all(3),
            child: Divider(
              color: Colors.black,
              height: 3,
            ),
          ),
        ],
      ),
    );
  }
}
