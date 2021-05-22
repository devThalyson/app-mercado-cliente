// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$formKeyAtom = Atom(name: '_LoginControllerBase.formKey');

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

  final _$formKeyPasswordResetAtom =
      Atom(name: '_LoginControllerBase.formKeyPasswordReset');

  @override
  GlobalKey<FormState> get formKeyPasswordReset {
    _$formKeyPasswordResetAtom.reportRead();
    return super.formKeyPasswordReset;
  }

  @override
  set formKeyPasswordReset(GlobalKey<FormState> value) {
    _$formKeyPasswordResetAtom.reportWrite(value, super.formKeyPasswordReset,
        () {
      super.formKeyPasswordReset = value;
    });
  }

  final _$controllerEmailAtom =
      Atom(name: '_LoginControllerBase.controllerEmail');

  @override
  TextEditingController get controllerEmail {
    _$controllerEmailAtom.reportRead();
    return super.controllerEmail;
  }

  @override
  set controllerEmail(TextEditingController value) {
    _$controllerEmailAtom.reportWrite(value, super.controllerEmail, () {
      super.controllerEmail = value;
    });
  }

  final _$controllerPasswordResetAtom =
      Atom(name: '_LoginControllerBase.controllerPasswordReset');

  @override
  TextEditingController get controllerPasswordReset {
    _$controllerPasswordResetAtom.reportRead();
    return super.controllerPasswordReset;
  }

  @override
  set controllerPasswordReset(TextEditingController value) {
    _$controllerPasswordResetAtom
        .reportWrite(value, super.controllerPasswordReset, () {
      super.controllerPasswordReset = value;
    });
  }

  final _$controllerPasswordAtom =
      Atom(name: '_LoginControllerBase.controllerPassword');

  @override
  TextEditingController get controllerPassword {
    _$controllerPasswordAtom.reportRead();
    return super.controllerPassword;
  }

  @override
  set controllerPassword(TextEditingController value) {
    _$controllerPasswordAtom.reportWrite(value, super.controllerPassword, () {
      super.controllerPassword = value;
    });
  }

  final _$blockPasswordAtom = Atom(name: '_LoginControllerBase.blockPassword');

  @override
  bool get blockPassword {
    _$blockPasswordAtom.reportRead();
    return super.blockPassword;
  }

  @override
  set blockPassword(bool value) {
    _$blockPasswordAtom.reportWrite(value, super.blockPassword, () {
      super.blockPassword = value;
    });
  }

  final _$errorMsgAtom = Atom(name: '_LoginControllerBase.errorMsg');

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

  final _$msgPasswordResetAtom =
      Atom(name: '_LoginControllerBase.msgPasswordReset');

  @override
  String? get msgPasswordReset {
    _$msgPasswordResetAtom.reportRead();
    return super.msgPasswordReset;
  }

  @override
  set msgPasswordReset(String? value) {
    _$msgPasswordResetAtom.reportWrite(value, super.msgPasswordReset, () {
      super.msgPasswordReset = value;
    });
  }

  final _$progressAtom = Atom(name: '_LoginControllerBase.progress');

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

  final _$progressPasswordResetAtom =
      Atom(name: '_LoginControllerBase.progressPasswordReset');

  @override
  bool get progressPasswordReset {
    _$progressPasswordResetAtom.reportRead();
    return super.progressPasswordReset;
  }

  @override
  set progressPasswordReset(bool value) {
    _$progressPasswordResetAtom.reportWrite(value, super.progressPasswordReset,
        () {
      super.progressPasswordReset = value;
    });
  }

  final _$formKeyPasswordResetIsValidateAtom =
      Atom(name: '_LoginControllerBase.formKeyPasswordResetIsValidate');

  @override
  bool get formKeyPasswordResetIsValidate {
    _$formKeyPasswordResetIsValidateAtom.reportRead();
    return super.formKeyPasswordResetIsValidate;
  }

  @override
  set formKeyPasswordResetIsValidate(bool value) {
    _$formKeyPasswordResetIsValidateAtom
        .reportWrite(value, super.formKeyPasswordResetIsValidate, () {
      super.formKeyPasswordResetIsValidate = value;
    });
  }

  final _$loginFunctionAsyncAction =
      AsyncAction('_LoginControllerBase.loginFunction');

  @override
  Future<dynamic> loginFunction() {
    return _$loginFunctionAsyncAction.run(() => super.loginFunction());
  }

  final _$resetPasswordAsyncAction =
      AsyncAction('_LoginControllerBase.resetPassword');

  @override
  Future<dynamic> resetPassword() {
    return _$resetPasswordAsyncAction.run(() => super.resetPassword());
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  dynamic changeBLockPassword() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.changeBLockPassword');
    try {
      return super.changeBLockPassword();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic formKeyPasswordResetValidate() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction(
        name: '_LoginControllerBase.formKeyPasswordResetValidate');
    try {
      return super.formKeyPasswordResetValidate();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formKey: ${formKey},
formKeyPasswordReset: ${formKeyPasswordReset},
controllerEmail: ${controllerEmail},
controllerPasswordReset: ${controllerPasswordReset},
controllerPassword: ${controllerPassword},
blockPassword: ${blockPassword},
errorMsg: ${errorMsg},
msgPasswordReset: ${msgPasswordReset},
progress: ${progress},
progressPasswordReset: ${progressPasswordReset},
formKeyPasswordResetIsValidate: ${formKeyPasswordResetIsValidate}
    ''';
  }
}
