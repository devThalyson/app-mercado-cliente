import 'package:app_mercado/custom_widgets/custom_text/custom_text.dart';

import 'package:flutter/material.dart';

class CustomBuyButton extends StatelessWidget {
  final bool noMargin;
  final Function function;
  final bool removeProduct;

  CustomBuyButton(
      {required this.function,
      this.noMargin = false,
      this.removeProduct = false});

  @override
  Widget build(BuildContext context) {
    return removeProduct == false
        ? Container(
            margin: noMargin == false
                ? EdgeInsets.only(
                    top: 2,
                    left: 2,
                    right: 2,
                  )
                : EdgeInsets.all(0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.green[900],
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextButton(
              onPressed: () {
                function();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    texto: "Adicionar",
                    bold: true,
                    cor: Colors.white,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 3),
                    child: Icon(
                      Icons.add_shopping_cart,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        : Container(
            margin: noMargin == false
                ? EdgeInsets.only(
                    top: 2,
                    left: 2,
                    right: 2,
                  )
                : EdgeInsets.all(0),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.red[900],
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextButton(
              onPressed: () {
                function();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    texto: "Remover",
                    bold: true,
                    cor: Colors.white,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 3),
                    child: Icon(
                      Icons.remove_shopping_cart,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
