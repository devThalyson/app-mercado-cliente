// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorys_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategorysController on _CategorysControllerBase, Store {
  final _$categorysAtom = Atom(name: '_CategorysControllerBase.categorys');

  @override
  List<Categoria> get categorys {
    _$categorysAtom.reportRead();
    return super.categorys;
  }

  @override
  set categorys(List<Categoria> value) {
    _$categorysAtom.reportWrite(value, super.categorys, () {
      super.categorys = value;
    });
  }

  final _$errorMsgAtom = Atom(name: '_CategorysControllerBase.errorMsg');

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

  final _$progressAtom = Atom(name: '_CategorysControllerBase.progress');

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

  final _$categorysLoadedAtom =
      Atom(name: '_CategorysControllerBase.categorysLoaded');

  @override
  bool get categorysLoaded {
    _$categorysLoadedAtom.reportRead();
    return super.categorysLoaded;
  }

  @override
  set categorysLoaded(bool value) {
    _$categorysLoadedAtom.reportWrite(value, super.categorysLoaded, () {
      super.categorysLoaded = value;
    });
  }

  final _$getCategorysAsyncAction =
      AsyncAction('_CategorysControllerBase.getCategorys');

  @override
  Future<dynamic> getCategorys() {
    return _$getCategorysAsyncAction.run(() => super.getCategorys());
  }

  @override
  String toString() {
    return '''
categorys: ${categorys},
errorMsg: ${errorMsg},
progress: ${progress},
categorysLoaded: ${categorysLoaded}
    ''';
  }
}
