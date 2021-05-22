import 'package:app_mercado/model/cliente.dart';
import 'package:app_mercado/service/user_services/update_service.dart';
import 'package:app_mercado/utils/api_response.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:mobx/mobx.dart';
part 'user_details_controller.g.dart';

class UserDetailsController = _UserDetailsControllerBase
    with _$UserDetailsController;

abstract class _UserDetailsControllerBase with Store {
  ////// INICIO - Observables //////

  @observable
  Cliente? cliente;

  @observable
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  @observable
  GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();

  @observable
  GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  @observable
  GlobalKey<FormState> contactAdminFormKey = GlobalKey<FormState>();

  @observable
  TextEditingController districtController = TextEditingController();

  @observable
  TextEditingController roadController = TextEditingController();

  @observable
  TextEditingController numberHouseController = TextEditingController();

  @observable
  TextEditingController referencePointController = TextEditingController();

  @observable
  TextEditingController actualEmailController = TextEditingController();

  @observable
  TextEditingController newEmailController = TextEditingController();

  @observable
  TextEditingController repeatNewEmailController = TextEditingController();

  TextEditingController actualPasswordController = TextEditingController();

  @observable
  TextEditingController newPasswordController = TextEditingController();

  @observable
  TextEditingController repeatNewPasswordController = TextEditingController();

  @observable
  TextEditingController subjectController = TextEditingController();

  @observable
  TextEditingController bodyController = TextEditingController();

  @observable
  String addressErrorMsg = "";

  @observable
  String emailMsg = "";

  @observable
  String passwordMsg = "";

  @observable
  String? contactAdminMsg;

  @observable
  bool? addressFormValidate;

  @observable
  bool? emailFormValidate;

  @observable
  bool? passwordFormValidate;

  @observable
  bool? contactAdminFormValidate;

  @observable
  bool progress = false;

  ////// FIM - Observables //////

  ////// INICIO - Actions //////

  @action
  getClient() async {
    cliente = await Cliente.get();
    print(cliente.toString());
  }

  @action
  clearCachedClient() {
    Cliente.clear();
    cliente = null;
  }

  @action
  clearEmailFields() {
    newEmailController.text = "";
    actualEmailController.text = "";
    repeatNewEmailController.text = "";
  }

  @action
  clearPasswordFields() {
    newPasswordController.text = "";
    actualPasswordController.text = "";
    repeatNewPasswordController.text = "";
  }

  @action
  catchClientAddress() {
    List<String> address = cliente!.endereco!.split(",");
    districtController.text = address[0];
    roadController.text = address[1];
    numberHouseController.text = address[2];
    referencePointController.text = address[3];
  }

  @action
  updateClientAddress() async {
    if (!addressFormKey.currentState!.validate()) {
      addressFormValidate = false;
      return null;
    } else {
      addressFormValidate = true;
      String endereco =
          "${districtController.text},${roadController.text},${numberHouseController.text},${referencePointController.text}";
      progress = true;
      ApiResponse response = await UpdateService.put(endereco: endereco);
      if (response.ok == true) {
        progress = false;
        addressErrorMsg = "";
        getClient();
      } else {
        progress = false;
        addressErrorMsg = response.msg!;
      }
    }
  }

  @action
  updateClientEmail() async {
    emailFormValidate = true;
    String email = newEmailController.text;
    progress = true;
    ApiResponse response = await UpdateService.put(email: email);
    progress = false;
    if (response.ok == true) {
      emailMsg = "Email alterado com sucesso! Faça login novamente!";
      clearEmailFields();
      clearCachedClient();
    } else {
      emailMsg = response.msg!;
    }
  }

  @action
  updateClientPassword() async {
    passwordFormValidate = true;
    String password = newPasswordController.text;
    progress = true;
    ApiResponse response = await UpdateService.put(senha: password);
    progress = false;
    if (response.ok == true) {
      passwordMsg = "Senha alterada com sucesso! Faça login novamente!";
      clearPasswordFields();
      clearCachedClient();
    } else {
      passwordMsg = response.msg!;
    }
  }

  @action
  Future<dynamic> contacAdmin() async {
    Email email = Email(
      body: bodyController.text,
      subject: subjectController.text,
      recipients: ['devthalyson@gmail.com'],
      isHTML: false,
      attachmentPaths: [],
    );

    try {
      progress = true;
      await FlutterEmailSender.send(email);
      progress = false;
      clearContactAdminFields();
      contactAdminMsg = "";
    } catch (error) {
      print(error);
      contactAdminMsg = 'Erro. Tente novamente!';
    }
  }

  @action
  checkFormContactAdminValidate() {
    contactAdminFormValidate = contactAdminFormKey.currentState!.validate();
  }

  @action
  checkFormEmailValidate() {
    emailFormValidate = emailFormKey.currentState!.validate();
  }

  @action
  checkFormPasswordValidate() {
    passwordFormValidate = passwordFormKey.currentState!.validate();
  }

  @action
  clearContactAdminFields() {
    subjectController.text = "";
    bodyController.text = "";
  }

  ////// FIM - Actions //////

  ////// INICIO - Validações de formulário //////

  String? validatorAddresFields(String? txt) {
    if (txt!.isEmpty) {
      return "Campo obrigatório";
    }
  }

  String? validatorExistingEmail(String? txt) {
    if (txt!.isEmpty || txt != cliente!.email) {
      return "O E-mail já cadastrado é diferente!";
    }
  }

  String? validatorNewEmail(String? txt) {
    if (!EmailValidator.validate(txt!)) {
      return "Digite um e-mail válido!";
    }
  }

  String? validatorRepeatNewEmail(String? txt) {
    if (txt != newEmailController.text) {
      return "Os novos e-mails não coicidem!";
    }
  }

  String? validatorExistingPassword(String? txt) {
    if (txt!.isEmpty || !DBCrypt().checkpw(txt, cliente!.senha!)) {
      return "A senha atual é diferente!";
    }
  }

  String? validatorNewPassword(String? txt) {
    if (txt!.isEmpty || txt.length < 5) {
      return "Minímo de 5 Caracteres";
    }
  }

  String? validatorRepeatNewPassword(String? txt) {
    if (txt! != newPasswordController.text) {
      return "As senhas não coicidem!";
    }
  }

  ////// FIM - Validações de formulário //////
}
