import 'package:app_mercado/controller/buys_controllers/client_buys_controller/client_buys_controller.dart';
import 'package:app_mercado/custom_widgets/custom_bars/custom_tab_bar.dart';
import 'package:app_mercado/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado/views/buys_views/buys_status_tabs/buys_accepteds.dart';
import 'package:app_mercado/views/buys_views/buys_status_tabs/buys_pendings.dart';
import 'package:app_mercado/views/buys_views/buys_status_tabs/buys_rejecteds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MyBuysView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controllerView =
        Provider.of<ClientBuysController>(context, listen: false);

    _getBuys(_controllerView, context);
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: CustomText(
            texto: "Minhas compras",
            bold: true,
          ),
          centerTitle: true,
        ),
        body: Observer(
          builder: (_) {
            return _controllerView.progress == true
                ? Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.green[900],
                    ),
                  )
                : _controllerView.errorMsg.isNotEmpty
                    ? Center(
                        child: CustomText(
                          texto: "Erro ao carregar suas compras",
                          bold: true,
                          cor: Colors.red[900],
                          tamanhoFonte: 18,
                        ),
                      )
                    : _body();
          },
        ),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.all(0),
          color: Colors.white,
          elevation: 15,
          child: _tabBar(),
        ),
        Expanded(
          child: _tabBarView(),
        ),
      ],
    );
  }

  _tabBar() {
    return TabBar(
      labelColor: Colors.black,
      indicatorColor: Colors.green,
      tabs: [
        CustomTabBar("Pendentes", "assets/images/pendente.png"),
        CustomTabBar("Confirmadas", "assets/images/aceito.png"),
        CustomTabBar("Rejeitadas", "assets/images/rejeitado.png"),
      ],
    );
  }

  _tabBarView() {
    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: [
        BuysPendings(),
        BuysAccepteds(),
        BuysRejecteds(),
      ],
    );
  }

  _getBuys(ClientBuysController _controllerView, BuildContext context) {
    if (_controllerView.loadBuys) {
      _controllerView.getClientBuys();
    }
  }
}
