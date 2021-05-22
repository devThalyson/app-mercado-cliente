import 'package:app_mercado/controller/buys_controllers/client_buys_controller/client_buys_controller.dart';
import 'package:app_mercado/controller/user_controllers/home_controller/home_controller.dart';
import 'package:app_mercado/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado/views/buys_views/my_buys_view.dart';
import 'package:app_mercado/views/products_views/products_view.dart';
import 'package:app_mercado/views/user_views/user_details_views/user_details_view.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  final _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigatorBar(context),
      body: _body(),
    );
  }

  _body() {
    return Observer(
      builder: (_) {
        return IndexedStack(
          children: _listWidgets(),
          index: _controller.index,
        );
      },
    );
  }

  _listWidgets() {
    return <Widget>[
      ListProducts(),
      MyBuysView(),
      UserDetailsView(),
    ];
  }

  _bottomNavigatorBar(BuildContext context) {
    return Observer(
      builder: (_) {
        return BottomNavigationBar(
          elevation: 20,
          backgroundColor: Colors.green,
          unselectedLabelStyle: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          selectedLabelStyle: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
          ),
          items: [
            _bottomNavigatorBarItem(
              titulo: "Produtos",
              icone: Icon(Icons.fastfood_outlined),
            ),
            _bottomNavigatorBarItem(
              titulo: "Minhas compras",
              icone: Provider.of<ClientBuysController>(context, listen: false)
                          .clientPendingBuys
                          .length >
                      0
                  ? Badge(
                      position: BadgePosition.bottomStart(
                        bottom: 5,
                        start: 15,
                      ),
                      badgeContent: CustomText(
                        texto: Provider.of<ClientBuysController>(context,
                                listen: false)
                            .clientPendingBuys
                            .length
                            .toString(),
                        cor: Colors.white,
                        tamanhoFonte: 15,
                      ),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                      ),
                    )
                  : Icon(
                      Icons.shopping_cart_outlined,
                    ),
              iconeAtivo:
                  Provider.of<ClientBuysController>(context, listen: false)
                              .clientPendingBuys
                              .length >
                          0
                      ? Badge(
                          position: BadgePosition.bottomStart(
                            bottom: 5,
                            start: 15,
                          ),
                          badgeContent: CustomText(
                            texto: Provider.of<ClientBuysController>(context,
                                    listen: false)
                                .clientPendingBuys
                                .length
                                .toString(),
                            cor: Colors.white,
                            tamanhoFonte: 15,
                          ),
                          child: Icon(
                            Icons.shopping_cart,
                          ),
                        )
                      : Icon(
                          Icons.shopping_cart,
                        ),
            ),
            _bottomNavigatorBarItem(
              titulo: "Meus dados",
              icone: Icon(
                Icons.person,
              ),
            ),
          ],
          currentIndex: _controller.index,
          type: BottomNavigationBarType.fixed,
          onTap: _controller.setIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
        );
      },
    );
  }

  _bottomNavigatorBarItem({
    required String titulo,
    required Widget icone,
    Widget? iconeAtivo,
  }) {
    return BottomNavigationBarItem(
      icon: Container(
        height: 25,
        child: icone,
      ),
      activeIcon: Container(
        height: 25,
        child: iconeAtivo != null ? iconeAtivo : icone,
      ),
      label: titulo,
    );
  }
}
