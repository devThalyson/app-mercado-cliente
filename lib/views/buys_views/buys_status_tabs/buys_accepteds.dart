import 'package:app_mercado/controller/buys_controllers/client_buys_controller/client_buys_controller.dart';
import 'package:app_mercado/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado/model/compra.dart';
import 'package:app_mercado/views/buys_views/buy_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class BuysAccepteds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Provider.of<ClientBuysController>(context, listen: false)
                    .clientConfirmedBuys
                    .length >
                0
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      margin: EdgeInsets.only(
                        left: 6,
                        right: 6,
                        top: 4,
                        bottom: 4,
                      ),
                      elevation: 10,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: _richText(),
                      ),
                    ),
                    _listBuys(
                        context,
                        Provider.of<ClientBuysController>(context,
                                listen: false)
                            .clientConfirmedBuys),
                  ],
                ),
              )
            : Container(
                alignment: Alignment.center,
                child: CustomText(
                  texto: "Você não tem compras confirmadas!",
                  bold: true,
                  tamanhoFonte: 18,
                  cor: Colors.green[900],
                ),
              );
      },
    );
  }

  _listBuys(BuildContext context, List<Compra> clientConfirmedBuys) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: clientConfirmedBuys.length,
      itemBuilder: (context, index) {
        Compra compra = clientConfirmedBuys[index];
        return BuyItem(compra);
      },
    );
  }

  _richText() {
    return RichText(
      textAlign: TextAlign.justify,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: "Essas são suas compras ",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: ('Google'),
            ),
          ),
          TextSpan(
            text: "CONFIRMADAS",
            style: TextStyle(
              color: Colors.green[900],
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: ('Google'),
            ),
          ),
          TextSpan(
            text:
                ". Caso alguma compra ainda não tenha chegado, não se preocupe! Ela já deve estar a caminho do seu endereço.",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: ('Google'),
            ),
          ),
        ],
      ),
    );
  }
}
