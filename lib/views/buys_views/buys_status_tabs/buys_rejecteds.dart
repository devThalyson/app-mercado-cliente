import 'package:app_mercado/controller/buys_controllers/client_buys_controller/client_buys_controller.dart';
import 'package:app_mercado/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado/model/compra.dart';
import 'package:app_mercado/views/buys_views/buy_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class BuysRejecteds extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Provider.of<ClientBuysController>(context, listen: false)
                    .clientRejectedBuys
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
                            .clientRejectedBuys),
                  ],
                ),
              )
            : Center(
                child: CustomText(
                  texto: "Você não tem compras rejeitadas!",
                  bold: true,
                  tamanhoFonte: 18,
                  cor: Colors.red[900],
                ),
              );
      },
    );
  }

  _listBuys(BuildContext context, List<Compra> clientPendingBuys) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: clientPendingBuys.length,
      itemBuilder: (context, index) {
        Compra compra = clientPendingBuys[index];
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
            text: "REJEITADAS",
            style: TextStyle(
              color: Colors.red[900],
              fontWeight: FontWeight.bold,
              fontSize: 16,
              fontFamily: ('Google'),
            ),
          ),
          TextSpan(
            text: ". Você pode ver o motivo da rejeição de cada compra.",
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
