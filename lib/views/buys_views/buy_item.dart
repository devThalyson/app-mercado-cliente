import 'package:app_mercado/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado/model/compra.dart';
import 'package:app_mercado/utils/convert_date.dart';
import 'package:app_mercado/utils/convert_money.dart';
import 'package:app_mercado/views/buys_views/buy_products_modal.dart';
import 'package:flutter/material.dart';

class BuyItem extends StatelessWidget {
  final Compra compra;

  BuyItem(this.compra);

  @override
  Widget build(BuildContext context) {
    // Convertendo data da compra para o formato correto
    final String buyDate = ConvertDate().convertDate(compra.dataDeCompra!);

    // Convertendo a hora da compra para o formato correto
    final String buyHour = ConvertDate().convertHour(compra.dataDeCompra!);

    return Container(
      margin: EdgeInsets.only(
        left: 6,
        right: 6,
        top: 4,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: compra.status == "Pendente"
              ? Colors.orange.shade700
              : compra.status == "Confirmada"
                  ? Colors.green.shade800
                  : Colors.red.shade800,
          width: 2.5,
        ),
      ),
      child: Card(
        margin: EdgeInsets.all(0),
        elevation: 10,
        child: Container(
          margin: EdgeInsets.all(5),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  bottom: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: _richText("Compra feita em: ",
                          "$buyDate ás $buyHour", false, Colors.black),
                    ),
                    _richText(
                        "Taxa de entrega: ",
                        ConvertMoney().convertReal(
                          compra.taxaDeEntrega!,
                        ),
                        true,
                        Colors.green.shade700)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: _richText("Recebimento: ", "${compra.recebimento}",
                          false, Colors.black),
                    ),
                    _richText("Pagamento: ", "${compra.formaDePagamento}",
                        false, Colors.black),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 5,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: _richText(
                        "Status da compra: ",
                        "${compra.status}",
                        true,
                        compra.status == "Pendente"
                            ? Colors.orange.shade700
                            : compra.status == "Confirmada"
                                ? Colors.green.shade900
                                : Colors.red.shade900,
                      ),
                    ),
                    _richText(
                        "Valor total: ",
                        ConvertMoney().convertReal(
                          compra.preco!,
                        ),
                        true,
                        Colors.green.shade700),
                  ],
                ),
              ),
              compra.status == "Rejeitada"
                  ? Container(
                      margin: EdgeInsets.only(
                        bottom: 5,
                      ),
                      child: Row(
                        children: [
                          Flexible(
                            child: CustomText(
                              texto: "Motivo da rejeição: ",
                              bold: true,
                              cor: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (_) {
                                  return SingleChildScrollView(
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: CustomText(
                                        texto: compra.motivoRejeicao!,
                                        cor: Colors.black,
                                        tamanhoFonte: 19,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: CustomText(
                              texto: "Ver motivo",
                              bold: true,
                              cor: Colors.red[900],
                              underline: true,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              Container(
                margin: EdgeInsets.only(
                  top: 10,
                  bottom: 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        right: 10,
                      ),
                      height: 40,
                      width: 40,
                      child: Image.asset("assets/images/frutas.png"),
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (_) {
                            return BuyProductsModal(compra.produtos!);
                          },
                        );
                      },
                      child: CustomText(
                        texto: "Ver produtos da compra!",
                        bold: true,
                        tamanhoFonte: 17,
                        cor: Colors.deepPurple[900],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      height: 40,
                      width: 40,
                      child: Image.asset("assets/images/compras.png"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _richText(String text1, String text2, bool bold, Color color) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: text1,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontFamily: ('Google'),
            ),
          ),
          TextSpan(
            text: text2,
            style: TextStyle(
              color: color,
              fontFamily: ('Google'),
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
