import 'package:app_mercado/model/produto.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
part 'products_controllers.g.dart';

class ProductsController = _ProductsControllerBase with _$ProductsController;

abstract class _ProductsControllerBase with Store {
  @observable
  List<Produto> products = ObservableList<Produto>();

  @observable
  List<Produto> cachedProducts = ObservableList<Produto>();

  @observable
  TextEditingController controllerSearch = TextEditingController();

  @observable
  bool searchProducts = false;

  @action
  initializeProducts(List<Produto> produtos) {
    searchProducts = false;
    controllerSearch.text = "";

    List<Produto> p =
        produtos.where((produto) => produto.indisponivel == 0).toList();
    p.sort(
      (a, b) => a.nome!.compareTo(b.nome!),
    );

    products = p;
  }

  @action
  filterProducts() {
    searchProducts = true;
    cachedProducts = products
        .where(
          (element) => element.nome!.toLowerCase().contains(
                controllerSearch.text.toLowerCase(),
              ),
        )
        .toList();
  }
}
