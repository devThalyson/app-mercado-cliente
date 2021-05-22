import 'package:app_mercado/service/user_services/signup_service.dart';
import 'package:app_mercado/utils/api_response.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'signup_controller.g.dart';

class SignupController = _SignupControllerBase with _$SignupController;

abstract class _SignupControllerBase with Store {
  ////// INICIO - Observables //////
  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  TextEditingController dddController = TextEditingController();

  @observable
  TextEditingController telephoneNumberController = TextEditingController();

  @observable
  TextEditingController emailController = TextEditingController();

  @observable
  TextEditingController passwordController = TextEditingController();

  @observable
  TextEditingController repeatPasswordController = TextEditingController();

  @observable
  TextEditingController districtController = TextEditingController();

  @observable
  TextEditingController roadController = TextEditingController();

  @observable
  TextEditingController numberHouseController = TextEditingController();

  @observable
  TextEditingController referencePointController = TextEditingController();

  @observable
  String errorMsg = "";

  @observable
  bool progress = false;
  ////// FIM - Observables //////

  ////// INICIO - Actions //////
  @action
  Future<dynamic> signupFunction() async {
    // Primeiramente é checado se o formulário esta validado
    if (!formKey.currentState!.validate()) {
      return;
    } else {
      // Caso o formulário esteja válido, as variaveis abaixo são criadas
      // para conter os dados colocados nos campos do formulário
      // de cadastro.
      String nome = nameController.text;
      String email = emailController.text;
      String senha = passwordController.text;
      String telefone = dddController.text + telephoneNumberController.text;
      String endereco =
          "${districtController.text},${roadController.text},${numberHouseController.text},${referencePointController.text}";

      // O icone de progresso vai aparecer no botão de cadastro.
      progress = true;

      // Posteriormente, o método de cadastro é chamado na camada de serviço,
      // levando consigo os dados inputados pelo usuário
      ApiResponse response =
          await SignupService.cadastro(nome, telefone, email, senha, endereco);

      // Caso o cadastro seja realizado com sucesso, as instruções abaixo
      // serão executadas.
      if (response.ok == true) {
        // O icone de progresso vai desaparecer do botão de cadastro.
        progress = false;
        // Limpando os campos de formulário.
        nameController.text = "";
        dddController.text = "";
        telephoneNumberController.text = "";
        emailController.text = "";
        passwordController.text = "";
        repeatPasswordController.text = "";
        districtController.text = "";
        roadController.text = "";
        numberHouseController.text = "";
        referencePointController.text = "";
        // Limpando os campos de formulário.

        // Um valor booleano true é retornado para sinalizar que o cadastro
        // foi realizado com sucesso.
        return true;
      } else {
        // O icone de progresso vai desaparecer do botão de cadastro.
        progress = false;
        // Caso o cadastro não seja realizado com sucesso, a variável
        // errorMsg vai ser preenchida pelo erro da camada de serviço
        // e exibida na tela de maneira tratada.
        errorMsg = response.msg.toString();

        // Um valor booleano false é retornado para sinalizar que houve
        // algum erro no processo de cadastro.
        return false;
      }
    }
  }
  ////// FIM - Actions //////

  ////// INICIO - Validações de formulário //////
  String? validatorNameField(String? txt) {
    if (txt!.isEmpty) {
      return "Preencha o campo de nome";
    }
    if (txt.length < 3) {
      return "O seu nome precisa ter pelo menos 3 letras";
    }
  }

  String? validatorDddField(String? txt) {
    if (txt!.isEmpty || txt.length < 2) {
      return "Preencha";
    }
  }

  String? validatorTelephoneNumberField(String? txt) {
    if (txt!.isEmpty || txt.length < 9) {
      return "Preencha corretamente";
    }
  }

  String? validatorEmailField(String? txt) {
    if (!EmailValidator.validate(txt!)) {
      return "Digite um e-mail válido!";
    }
  }

  String? validatorPasswordField(String? txt) {
    if (txt!.isEmpty || txt.length < 5) {
      return "Minímo de 5 Caracteres";
    }
  }

  String? validatorRepeatPasswordField(String? txt) {
    if (txt!.isEmpty || txt != passwordController.text) {
      return "As senhas não coincidem";
    }
  }

  String? validatorAddresFields(String? txt) {
    if (txt!.isEmpty) {
      return "Campo obrigatório";
    }
  }

  ////// INICIO - Validações de formulário //////

}
