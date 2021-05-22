import 'package:app_mercado/controller/products_controllers/products_controllers.dart';
import 'package:app_mercado/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado/model/produto.dart';
import 'package:app_mercado/views/products_views/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ProductsList extends StatelessWidget {
  final List<Produto> produtos;

  ProductsList(this.produtos);

  final _controllerView = ProductsController();

  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
        body: _body(produtos),
      ),
    );
  }

  _body(List<Produto> produtos) {
    _controllerView.initializeProducts(produtos);

    return _controllerView.products.length > 0
        ? _gridView()
        : Center(
            child: CustomText(
              texto: "Essa categoria não tem produtos.",
              cor: Colors.black,
              bold: true,
              tamanhoFonte: 18,
            ),
          );
  }

  _gridView() {
    return Observer(
      builder: (_) {
        return Column(
          children: [
            _searchProduct(),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisExtent: 225,
                  childAspectRatio: 2 / 3,
                  mainAxisSpacing: 10,
                ),
                itemCount: _controllerView.searchProducts == false
                    ? _controllerView.products.length
                    : _controllerView.cachedProducts.length,
                itemBuilder: (context, index) {
                  Produto produto = _controllerView.searchProducts == false
                      ? _controllerView.products[index]
                      : _controllerView.cachedProducts[index];

                  return ProductCard(produto);
                },
              ),
            ),
          ],
        );
      },
    );
  }

  _searchProduct() {
    return Container(
      margin: EdgeInsets.all(8),
      child: TextFormField(
        controller: _controllerView.controllerSearch,
        onChanged: (search) {
          _controllerView.filterProducts();
        },
        decoration: InputDecoration(
          hintText: "Pesquise um produto",
          hintStyle: TextStyle(
            color: Colors.black,
            fontSize: 19,
          ),
          suffixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
