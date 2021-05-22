import 'package:app_mercado/controller/buys_controllers/buys_cart_controller/buys_cart_controller.dart';
import 'package:app_mercado/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado/model/produto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class CustomListBuyButton extends StatelessWidget {
  final Produto produto;

  CustomListBuyButton(this.produto);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 10,
        right: 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.green[900],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 35,
            child: TextButton(
              onPressed: () {
                Provider.of<BuysCartController>(context, listen: false)
                    .removeProductOneAOne(produto);
              },
              child: CustomText(
                texto: "-",
                bold: true,
                tamanhoFonte: 20,
                cor: Colors.white,
              ),
            ),
          ),
          _quantityOfProducts(context),
          Container(
            height: 35,
            width: 40,
            child: TextButton(
              onPressed: () {
                Provider.of<BuysCartController>(context, listen: false)
                    .setProductInBuyCart(produto);
              },
              child: CustomText(
                texto: "+",
                bold: true,
                tamanhoFonte: 20,
                cor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _quantityOfProducts(BuildContext context) {
    return Observer(
      builder: (_) {
        int quantityOfProduct = Provider.of<BuysCartController>(context)
            .products
            .map((element) => element.id == produto.id ? 1 : 0)
            .reduce((value, element) => value + element);
        double quantity = produto.minimoVenda! * quantityOfProduct;
        return Container(
          alignment: Alignment.center,
          width: 60,
          height: 34,
          color: Colors.white,
          child: CustomText(
            texto: _checkQuantity(quantity),
            bold: true,
            tamanhoFonte: 15,
          ),
        );
      },
    );
  }

  String _checkQuantity(double quantity) {
    if (quantity % 1 == 0) {
      return quantity.truncate().toString();
    } else {
      return quantity.toStringAsFixed(3);
    }
  }
}
