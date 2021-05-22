// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_buys_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClientBuysController on _ClientBuysControllerBase, Store {
  final _$clientBuysAtom = Atom(name: '_ClientBuysControllerBase.clientBuys');

  @override
  List<Compra> get clientBuys {
    _$clientBuysAtom.reportRead();
    return super.clientBuys;
  }

  @override
  set clientBuys(List<Compra> value) {
    _$clientBuysAtom.reportWrite(value, super.clientBuys, () {
      super.clientBuys = value;
    });
  }

  final _$clientPendingBuysAtom =
      Atom(name: '_ClientBuysControllerBase.clientPendingBuys');

  @override
  List<Compra> get clientPendingBuys {
    _$clientPendingBuysAtom.reportRead();
    return super.clientPendingBuys;
  }

  @override
  set clientPendingBuys(List<Compra> value) {
    _$clientPendingBuysAtom.reportWrite(value, super.clientPendingBuys, () {
      super.clientPendingBuys = value;
    });
  }

  final _$clientConfirmedBuysAtom =
      Atom(name: '_ClientBuysControllerBase.clientConfirmedBuys');

  @override
  List<Compra> get clientConfirmedBuys {
    _$clientConfirmedBuysAtom.reportRead();
    return super.clientConfirmedBuys;
  }

  @override
  set clientConfirmedBuys(List<Compra> value) {
    _$clientConfirmedBuysAtom.reportWrite(value, super.clientConfirmedBuys, () {
      super.clientConfirmedBuys = value;
    });
  }

  final _$clientRejectedBuysAtom =
      Atom(name: '_ClientBuysControllerBase.clientRejectedBuys');

  @override
  List<Compra> get clientRejectedBuys {
    _$clientRejectedBuysAtom.reportRead();
    return super.clientRejectedBuys;
  }

  @override
  set clientRejectedBuys(List<Compra> value) {
    _$clientRejectedBuysAtom.reportWrite(value, super.clientRejectedBuys, () {
      super.clientRejectedBuys = value;
    });
  }

  final _$separatedProductsAtom =
      Atom(name: '_ClientBuysControllerBase.separatedProducts');

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

  final _$errorMsgAtom = Atom(name: '_ClientBuysControllerBase.errorMsg');

  @override
  String get errorMsg {
    _$errorMsgAtom.reportRead();
    return super.errorMsg;
  }

  @override
  set errorMsg(String value) {
    _$errorMsgAtom.reportWrite(value, super.errorMsg, () {
      super.errorMsg = value;
    });
  }

  final _$loadBuysAtom = Atom(name: '_ClientBuysControllerBase.loadBuys');

  @override
  bool get loadBuys {
    _$loadBuysAtom.reportRead();
    return super.loadBuys;
  }

  @override
  set loadBuys(bool value) {
    _$loadBuysAtom.reportWrite(value, super.loadBuys, () {
      super.loadBuys = value;
    });
  }

  final _$progressAtom = Atom(name: '_ClientBuysControllerBase.progress');

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

  final _$getClientBuysAsyncAction =
      AsyncAction('_ClientBuysControllerBase.getClientBuys');

  @override
  Future<dynamic> getClientBuys() {
    return _$getClientBuysAsyncAction.run(() => super.getClientBuys());
  }

  final _$_ClientBuysControllerBaseActionController =
      ActionController(name: '_ClientBuysControllerBase');

  @override
  dynamic setLoadBuys() {
    final _$actionInfo = _$_ClientBuysControllerBaseActionController
        .startAction(name: '_ClientBuysControllerBase.setLoadBuys');
    try {
      return super.setLoadBuys();
    } finally {
      _$_ClientBuysControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic separeBuys() {
    final _$actionInfo = _$_ClientBuysControllerBaseActionController
        .startAction(name: '_ClientBuysControllerBase.separeBuys');
    try {
      return super.separeBuys();
    } finally {
      _$_ClientBuysControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSeparetedProducts(List<Produto> products) {
    final _$actionInfo = _$_ClientBuysControllerBaseActionController
        .startAction(name: '_ClientBuysControllerBase.setSeparetedProducts');
    try {
      return super.setSeparetedProducts(products);
    } finally {
      _$_ClientBuysControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  int checkQuantityOfProductInBuyList(Produto produto, List<Produto> products) {
    final _$actionInfo =
        _$_ClientBuysControllerBaseActionController.startAction(
            name: '_ClientBuysControllerBase.checkQuantityOfProductInBuyList');
    try {
      return super.checkQuantityOfProductInBuyList(produto, products);
    } finally {
      _$_ClientBuysControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
clientBuys: ${clientBuys},
clientPendingBuys: ${clientPendingBuys},
clientConfirmedBuys: ${clientConfirmedBuys},
clientRejectedBuys: ${clientRejectedBuys},
separatedProducts: ${separatedProducts},
errorMsg: ${errorMsg},
loadBuys: ${loadBuys},
progress: ${progress}
    ''';
  }
}
