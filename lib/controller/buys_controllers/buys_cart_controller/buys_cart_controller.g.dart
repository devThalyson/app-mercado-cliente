// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buys_cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BuysCartController on _BuysCartControllerBase, Store {
  final _$radioReceiverBuyAtom =
      Atom(name: '_BuysCartControllerBase.radioReceiverBuy');

  @override
  int get radioReceiverBuy {
    _$radioReceiverBuyAtom.reportRead();
    return super.radioReceiverBuy;
  }

  @override
  set radioReceiverBuy(int value) {
    _$radioReceiverBuyAtom.reportWrite(value, super.radioReceiverBuy, () {
      super.radioReceiverBuy = value;
    });
  }

  final _$radioPaymentBuyAtom =
      Atom(name: '_BuysCartControllerBase.radioPaymentBuy');

  @override
  int get radioPaymentBuy {
    _$radioPaymentBuyAtom.reportRead();
    return super.radioPaymentBuy;
  }

  @override
  set radioPaymentBuy(int value) {
    _$radioPaymentBuyAtom.reportWrite(value, super.radioPaymentBuy, () {
      super.radioPaymentBuy = value;
    });
  }

  final _$controllerTextPaymentAtom =
      Atom(name: '_BuysCartControllerBase.controllerTextPayment');

  @override
  TextEditingController get controllerTextPayment {
    _$controllerTextPaymentAtom.reportRead();
    return super.controllerTextPayment;
  }

  @override
  set controllerTextPayment(TextEditingController value) {
    _$controllerTextPaymentAtom.reportWrite(value, super.controllerTextPayment,
        () {
      super.controllerTextPayment = value;
    });
  }

  final _$formKeyAtom = Atom(name: '_BuysCartControllerBase.formKey');

  @override
  GlobalKey<FormState> get formKey {
    _$formKeyAtom.reportRead();
    return super.formKey;
  }

  @override
  set formKey(GlobalKey<FormState> value) {
    _$formKeyAtom.reportWrite(value, super.formKey, () {
      super.formKey = value;
    });
  }

  final _$productsAtom = Atom(name: '_BuysCartControllerBase.products');

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

  final _$separatedProductsAtom =
      Atom(name: '_BuysCartControllerBase.separatedProducts');

  @override
  List<Produto> get separatedProducts {
    _$separatedProductsAtom.reportRead();
    return super.separatedProducts;
  }

  @override
  set separatedProducts(List<Produto> value) {
    _$separatedProductsAtom.reportWrite(value, super.separatedProducts, () {
      super.separatedProducts = value;
    });
  }

  final _$subTotalPriceAtom =
      Atom(name: '_BuysCartControllerBase.subTotalPrice');

  @override
  double get subTotalPrice {
    _$subTotalPriceAtom.reportRead();
    return super.subTotalPrice;
  }

  @override
  set subTotalPrice(double value) {
    _$subTotalPriceAtom.reportWrite(value, super.subTotalPrice, () {
      super.subTotalPrice = value;
    });
  }

  final _$deliveryFeeAtom = Atom(name: '_BuysCartControllerBase.deliveryFee');

  @override
  double get deliveryFee {
    _$deliveryFeeAtom.reportRead();
    return super.deliveryFee;
  }

  @override
  set deliveryFee(double value) {
    _$deliveryFeeAtom.reportWrite(value, super.deliveryFee, () {
      super.deliveryFee = value;
    });
  }

  final _$finalPriceAtom = Atom(name: '_BuysCartControllerBase.finalPrice');

  @override
  double get finalPrice {
    _$finalPriceAtom.reportRead();
    return super.finalPrice;
  }

  @override
  set finalPrice(double value) {
    _$finalPriceAtom.reportWrite(value, super.finalPrice, () {
      super.finalPrice = value;
    });
  }

  final _$progressAtom = Atom(name: '_BuysCartControllerBase.progress');

  @override
  bool get progress {
    _$progressAtom.reportRead();
    return super.progress;
  }

  @override
  set progress(bool value) {
    _$progressAtom.reportWrite(value, super.progress, () {
      super.progress = value;
    });
  }

  final _$mensageAtom = Atom(name: '_BuysCartControllerBase.mensage');

  @override
  String get mensage {
    _$mensageAtom.reportRead();
    return super.mensage;
  }

  @override
  set mensage(String value) {
    _$mensageAtom.reportWrite(value, super.mensage, () {
      super.mensage = value;
    });
  }

  final _$formValidateAtom = Atom(name: '_BuysCartControllerBase.formValidate');

  @override
  bool? get formValidate {
    _$formValidateAtom.reportRead();
    return super.formValidate;
  }

  @override
  set formValidate(bool? value) {
    _$formValidateAtom.reportWrite(value, super.formValidate, () {
      super.formValidate = value;
    });
  }

  final _$buyFunctionAsyncAction =
      AsyncAction('_BuysCartControllerBase.buyFunction');

  @override
  Future buyFunction() {
    return _$buyFunctionAsyncAction.run(() => super.buyFunction());
  }

  final _$_BuysCartControllerBaseActionController =
      ActionController(name: '_BuysCartControllerBase');

  @override
  dynamic setRadioReceiverBuy(int value) {
    final _$actionInfo = _$_BuysCartControllerBaseActionController.startAction(
        name: '_BuysCartControllerBase.setRadioReceiverBuy');
    try {
      return super.setRadioReceiverBuy(value);
    } finally {
      _$_BuysCartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setRadioPaymentBuy(int value) {
    final _$actionInfo = _$_BuysCartControllerBaseActionController.startAction(
        name: '_BuysCartControllerBase.setRadioPaymentBuy');
    try {
      return super.setRadioPaymentBuy(value);
    } finally {
      _$_BuysCartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setProductInBuyCart(Produto produto) {
    final _$actionInfo = _$_BuysCartControllerBaseActionController.startAction(
        name: '_BuysCartControllerBase.setProductInBuyCart');
    try {
      return super.setProductInBuyCart(produto);
    } finally {
      _$_BuysCartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeProductOfBuyCart(Produto produto) {
    final _$actionInfo = _$_BuysCartControllerBaseActionController.startAction(
        name: '_BuysCartControllerBase.removeProductOfBuyCart');
    try {
      return super.removeProductOfBuyCart(produto);
    } finally {
      _$_BuysCartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeProductOneAOne(Produto produto) {
    final _$actionInfo = _$_BuysCartControllerBaseActionController.startAction(
        name: '_BuysCartControllerBase.removeProductOneAOne');
    try {
      return super.removeProductOneAOne(produto);
    } finally {
      _$_BuysCartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic clearBuyCart() {
    final _$actionInfo = _$_BuysCartControllerBaseActionController.startAction(
        name: '_BuysCartControllerBase.clearBuyCart');
    try {
      return super.clearBuyCart();
    } finally {
      _$_BuysCartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic checkQuantityOfProductInBuyCart(Produto produto) {
    final _$actionInfo = _$_BuysCartControllerBaseActionController.startAction(
        name: '_BuysCartControllerBase.checkQuantityOfProductInBuyCart');
    try {
      return super.checkQuantityOfProductInBuyCart(produto);
    } finally {
      _$_BuysCartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSeparetedProducts() {
    final _$actionInfo = _$_BuysCartControllerBaseActionController.startAction(
        name: '_BuysCartControllerBase.setSeparetedProducts');
    try {
      return super.setSeparetedProducts();
    } finally {
      _$_BuysCartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setFinalPrice() {
    final _$actionInfo = _$_BuysCartControllerBaseActionController.startAction(
        name: '_BuysCartControllerBase.setFinalPrice');
    try {
      return super.setFinalPrice();
    } finally {
      _$_BuysCartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
radioReceiverBuy: ${radioReceiverBuy},
radioPaymentBuy: ${radioPaymentBuy},
controllerTextPayment: ${controllerTextPayment},
formKey: ${formKey},
products: ${products},
separatedProducts: ${separatedProducts},
subTotalPrice: ${subTotalPrice},
deliveryFee: ${deliveryFee},
finalPrice: ${finalPrice},
progress: ${progress},
mensage: ${mensage},
formValidate: ${formValidate}
    ''';
  }
}
