import 'package:app_mercado/controller/buys_controllers/buys_cart_controller/buys_cart_controller.dart';
import 'package:app_mercado/controller/categorys_controllers/categorys_controller.dart';
import 'package:app_mercado/custom_widgets/custom_bars/custom_tab_bar.dart';
import 'package:app_mercado/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado/model/categoria.dart';
import 'package:app_mercado/utils/nav.dart';
import 'package:app_mercado/views/buys_views/buys_cart_view.dart';
import 'package:app_mercado/views/products_views/products_list.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ListProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controllerView = Provider.of<CategorysController>(context);
    _getCategorys(_controllerView);

    return Observer(
      builder: (_) {
        return DefaultTabController(
          length: _controllerView.categorys
              .where((element) => element.ativa == 0)
              .toList()
              .length,
          initialIndex: 0,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: CustomText(
                texto: "Produtos",
                bold: true,
              ),
              actions: [
                Badge(
                  badgeContent: CustomText(
                    texto:
                        Provider.of<BuysCartController>(context, listen: false)
                            .separatedProducts
                            .length
                            .toString(),
                    tamanhoFonte: 15,
                    cor: Colors.white,
                  ),
                  position: BadgePosition.topEnd(top: 5, end: 5),
                  child: IconButton(
                    icon: Icon(
                      Icons.shopping_cart_rounded,
                    ),
                    onPressed: () {
                      push(
                        context,
                        CartBuysView(),
                      );
                    },
                  ),
                ),
              ],
            ),
            body: _controllerView.progress == true
                ? Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.green[900],
                    ),
                  )
                : _controllerView.errorMsg.isNotEmpty
                    ? Center(
                        child: CustomText(
                          texto: _controllerView.errorMsg,
                          cor: Colors.red[900],
                          bold: true,
                          tamanhoFonte: 18,
                        ),
                      )
                    : _body(context, _controllerView),
          ),
        );
      },
    );
  }

  _getCategorys(CategorysController _controllerView) {
    if (_controllerView.categorysLoaded == false) {
      _controllerView.getCategorys();
    }
  }

  _body(BuildContext context, CategorysController _controllerView) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.all(0),
          color: Colors.white,
          elevation: 15,
          child: _tabBar(_controllerView),
        ),
        Expanded(
          child: _tabBarView(_controllerView),
        ),
      ],
    );
  }

  _tabBar(CategorysController _controllerView) {
    List<Widget> widgets = [];

    for (Categoria category in _controllerView.categorys
        .where((element) => element.ativa == 0)
        .toList()) {
      widgets.add(
        CustomTabBar(
          category.nome!,
          category.imagem!,
          imageNetwork: true,
        ),
      );
    }
    return TabBar(
      isScrollable: true,
      labelColor: Colors.black,
      indicatorColor: Colors.green,
      tabs: widgets,
    );
  }

  _tabBarView(CategorysController _controllerView) {
    List<Widget> widgets = [];

    for (Categoria category in _controllerView.categorys
        .where((element) => element.ativa == 0)
        .toList()) {
      widgets.add(
        ProductsList(category.produtos!),
      );
    }

    return TabBarView(
      physics: NeverScrollableScrollPhysics(),
      children: widgets,
    );
  }
}
