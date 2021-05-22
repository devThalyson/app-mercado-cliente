// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_controllers.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductsController on _ProductsControllerBase, Store {
  final _$productsAtom = Atom(name: '_ProductsControllerBase.products');

  @override
  List<Produto> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<Produto> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$cachedProductsAtom =
      Atom(name: '_ProductsControllerBase.cachedProducts');

  @override
  List<Produto> get cachedProducts {
    _$cachedProductsAtom.reportRead();
    return super.cachedProducts;
  }

  @override
  set cachedProducts(List<Produto> value) {
    _$cachedProductsAtom.reportWrite(value, super.cachedProducts, () {
      super.cachedProducts = value;
    });
  }

  final _$controllerSearchAtom =
      Atom(name: '_ProductsControllerBase.controllerSearch');

  @override
  TextEditingController get controllerSearch {
    _$controllerSearchAtom.reportRead();
    return super.controllerSearch;
  }

  @override
  set controllerSearch(TextEditingController value) {
    _$controllerSearchAtom.reportWrite(value, super.controllerSearch, () {
      super.controllerSearch = value;
    });
  }

  final _$searchProductsAtom =
      Atom(name: '_ProductsControllerBase.searchProducts');

  @override
  bool get searchProducts {
    _$searchProductsAtom.reportRead();
    return super.searchProducts;
  }

  @override
  set searchProducts(bool value) {
    _$searchProductsAtom.reportWrite(value, super.searchProducts, () {
      super.searchProducts = value;
    });
  }

  final _$_ProductsControllerBaseActionController =
      ActionController(name: '_ProductsControllerBase');

  @override
  dynamic initializeProducts(List<Produto> produtos) {
    final _$actionInfo = _$_ProductsControllerBaseActionController.startAction(
        name: '_ProductsControllerBase.initializeProducts');
    try {
      return super.initializeProducts(produtos);
    } finally {
      _$_ProductsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic filterProducts() {
    final _$actionInfo = _$_ProductsControllerBaseActionController.startAction(
        name: '_ProductsControllerBase.filterProducts');
    try {
      return super.filterProducts();
    } finally {
      _$_ProductsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products},
cachedProducts: ${cachedProducts},
controllerSearch: ${controllerSearch},
searchProducts: ${searchProducts}
    ''';
  }
}
