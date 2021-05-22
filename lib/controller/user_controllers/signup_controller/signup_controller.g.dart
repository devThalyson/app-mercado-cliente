// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupController on _SignupControllerBase, Store {
  final _$formKeyAtom = Atom(name: '_SignupControllerBase.formKey');

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

  final _$nameControllerAtom =
      Atom(name: '_SignupControllerBase.nameController');

  @override
  TextEditingController get nameController {
    _$nameControllerAtom.reportRead();
    return super.nameController;
  }

  @override
  set nameController(TextEditingController value) {
    _$nameControllerAtom.reportWrite(value, super.nameController, () {
      super.nameController = value;
    });
  }

  final _$dddControllerAtom = Atom(name: '_SignupControllerBase.dddController');

  @override
  TextEditingController get dddController {
    _$dddControllerAtom.reportRead();
    return super.dddController;
  }

  @override
  set dddController(TextEditingController value) {
    _$dddControllerAtom.reportWrite(value, super.dddController, () {
      super.dddController = value;
    });
  }

  final _$telephoneNumberControllerAtom =
      Atom(name: '_SignupControllerBase.telephoneNumberController');

  @override
  TextEditingController get telephoneNumberController {
    _$telephoneNumberControllerAtom.reportRead();
    return super.telephoneNumberController;
  }

  @override
  set telephoneNumberController(TextEditingController value) {
    _$telephoneNumberControllerAtom
        .reportWrite(value, super.telephoneNumberController, () {
      super.telephoneNumberController = value;
    });
  }

  final _$emailControllerAtom =
      Atom(name: '_SignupControllerBase.emailController');

  @override
  TextEditingController get emailController {
    _$emailControllerAtom.reportRead();
    return super.emailController;
  }

  @override
  set emailController(TextEditingController value) {
    _$emailControllerAtom.reportWrite(value, super.emailController, () {
      super.emailController = value;
    });
  }

  final _$passwordControllerAtom =
      Atom(name: '_SignupControllerBase.passwordController');

  @override
  TextEditingController get passwordController {
    _$passwordControllerAtom.reportRead();
    return super.passwordController;
  }

  @override
  set passwordController(TextEditingController value) {
    _$passwordControllerAtom.reportWrite(value, super.passwordController, () {
      super.passwordController = value;
    });
  }

  final _$repeatPasswordControllerAtom =
      Atom(name: '_SignupControllerBase.repeatPasswordController');

  @override
  TextEditingController get repeatPasswordController {
    _$repeatPasswordControllerAtom.reportRead();
    return super.repeatPasswordController;
  }

  @override
  set repeatPasswordController(TextEditingController value) {
    _$repeatPasswordControllerAtom
        .reportWrite(value, super.repeatPasswordController, () {
      super.repeatPasswordController = value;
    });
  }

  final _$districtControllerAtom =
      Atom(name: '_SignupControllerBase.districtController');

  @override
  TextEditingController get districtController {
    _$districtControllerAtom.reportRead();
    return super.districtController;
  }

  @override
  set districtController(TextEditingController value) {
    _$districtControllerAtom.reportWrite(value, super.districtController, () {
      super.districtController = value;
    });
  }

  final _$roadControllerAtom =
      Atom(name: '_SignupControllerBase.roadController');

  @override
  TextEditingController get roadController {
    _$roadControllerAtom.reportRead();
    return super.roadController;
  }

  @override
  set roadController(TextEditingController value) {
    _$roadControllerAtom.reportWrite(value, super.roadController, () {
      super.roadController = value;
    });
  }

  final _$numberHouseControllerAtom =
      Atom(name: '_SignupControllerBase.numberHouseController');

  @override
  TextEditingController get numberHouseController {
    _$numberHouseControllerAtom.reportRead();
    return super.numberHouseController;
  }

  @override
  set numberHouseController(TextEditingController value) {
    _$numberHouseControllerAtom.reportWrite(value, super.numberHouseController,
        () {
      super.numberHouseController = value;
    });
  }

  final _$referencePointControllerAtom =
      Atom(name: '_SignupControllerBase.referencePointController');

  @override
  TextEditingController get referencePointController {
    _$referencePointControllerAtom.reportRead();
    return super.referencePointController;
  }

  @override
  set referencePointController(TextEditingController value) {
    _$referencePointControllerAtom
        .reportWrite(value, super.referencePointController, () {
      super.referencePointController = value;
    });
  }

  final _$errorMsgAtom = Atom(name: '_SignupControllerBase.errorMsg');

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

  final _$progressAtom = Atom(name: '_SignupControllerBase.progress');

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

  final _$signupFunctionAsyncAction =
      AsyncAction('_SignupControllerBase.signupFunction');

  @override
  Future<dynamic> signupFunction() {
    return _$signupFunctionAsyncAction.run(() => super.signupFunction());
  }

  @override
  String toString() {
    return '''
formKey: ${formKey},
nameController: ${nameController},
dddController: ${dddController},
telephoneNumberController: ${telephoneNumberController},
emailController: ${emailController},
passwordController: ${passwordController},
repeatPasswordController: ${repeatPasswordController},
districtController: ${districtController},
roadController: ${roadController},
numberHouseController: ${numberHouseController},
referencePointController: ${referencePointController},
errorMsg: ${errorMsg},
progress: ${progress}
    ''';
  }
}
