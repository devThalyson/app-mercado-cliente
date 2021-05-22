import 'package:app_mercado/service/user_services/login_service.dart';
import 'package:app_mercado/service/user_services/password_reset.dart';
import 'package:app_mercado/utils/api_response.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  ////// INICIO - Observables //////
  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  GlobalKey<FormState> formKeyPasswordReset = GlobalKey<FormState>();

  @observable
  TextEditingController controllerEmail = TextEditingController();

  @observable
  TextEditingController controllerPasswordReset = TextEditingController();

  @observable
  TextEditingController controllerPassword = TextEditingController();

  @observable
  bool blockPassword = true;

  @observable
  String errorMsg = "";

  @observable
  String? msgPasswordReset;

  @observable
  bool progress = false;

  @observable
  bool progressPasswordReset = false;

  @observable
  bool formKeyPasswordResetIsValidate = false;
  ////// FIM - Observables //////

  ////// INICIO - Actions //////
  @action
  changeBLockPassword() {
    blockPassword = !blockPassword;
  }

  @action
  formKeyPasswordResetValidate() {
    formKeyPasswordResetIsValidate =
        formKeyPasswordReset.currentState!.validate();
  }

  @action
  Future<dynamic> loginFunction() async {
    // Checa primeiramente se o formulário de Login está validado.
    if (!formKey.currentState!.validate()) {
      return;
    }
    // Caso o formulário de login seja válido, a tentativa de
    // login é feita.
    else {
      // O icone de progresso vai aparecer no botão de login.
      progress = true;
      ApiResponse response = await LoginService.login(
          controllerEmail.text, controllerPassword.text);

      // Se os dados (e-mail e senha) forem válidos, o login é
      // completado com sucesso.
      if (response.ok == true) {
        // O icone de progresso vai desaparecer do botão de cadastro.
        progress = false;

        return true;
      }
      // Se a tentativa for falha, um erro é retornado.
      else {
        // O icone de progresso vai desaparecer do botão de cadastro.
        progress = false;

        errorMsg = response.msg.toString();

        return false;
      }
    }
  }

  @action
  Future<dynamic> resetPassword() async {
    String email = controllerPasswordReset.text;

    progressPasswordReset = true;
    ApiResponse response = await PasswordReset.resetPassword(email);
    progressPasswordReset = false;

    if (response.ok == true) {
      msgPasswordReset =
          "Um link para alteração da sua senha foi enviado para o E-mail informado.";
      controllerPasswordReset.text = "";
    } else {
      msgPasswordReset =
          "Não existe nenhuma conta cadastrada com o E-mail informado.";
      controllerPasswordReset.text = "";
    }
  }
  ////// FIM - Actions //////

  ////// INICIO - Validações de formulário //////
  String? validatorLoginField(String? txt) {
    if (!EmailValidator.validate(txt!)) {
      return "Digite um e-mail válido!";
    }
  }

  String? validatorPasswordField(String? txt) {
    if (txt!.isEmpty) {
      return "Preencha o campo de senha!";
    }
  }

  String? validatorEmailReset(String? txt) {
    if (!EmailValidator.validate(txt!)) {
      return "Digite um e-mail válido!";
    }
  }
  ////// FIM - Validações de formulário //////
}
