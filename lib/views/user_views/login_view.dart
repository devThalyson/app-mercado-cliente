import 'package:app_mercado/controller/user_controllers/login_controller/login_controller.dart';
import 'package:app_mercado/custom_widgets/custom_buttons/custom_button.dart';
import 'package:app_mercado/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado/custom_widgets/custom_text/custom_text_form.dart';
import 'package:app_mercado/utils/alert.dart';
import 'package:app_mercado/utils/nav.dart';
import 'package:app_mercado/views/home_views/home_view.dart';
import 'package:app_mercado/views/user_views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginView extends StatelessWidget {
  final _controllerView = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return SingleChildScrollView(
      child: Observer(
        builder: (_) {
          return Form(
            key: _controllerView.formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 5.5,
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/logo.png",
                  ),
                ),
                Observer(
                  builder: (_) {
                    return Container(
                      margin: EdgeInsets.only(
                        top: 25,
                        left: 10,
                        right: 10,
                      ),
                      child: CustomTextForm(
                        dicaCampo: "E-mail",
                        validator: _controllerView.validatorLoginField,
                        acaoTeclado: TextInputAction.next,
                        tipoTeclado: TextInputType.emailAddress,
                        controller: _controllerView.controllerEmail,
                        icone: Icon(
                          Icons.email,
                        ),
                      ),
                    );
                  },
                ),
                Observer(
                  builder: (_) {
                    return Container(
                      margin: EdgeInsets.only(
                        top: 25,
                        left: 10,
                        right: 10,
                      ),
                      child: CustomTextForm(
                        dicaCampo: "Senha",
                        validator: _controllerView.validatorPasswordField,
                        acaoTeclado: TextInputAction.done,
                        tipoTeclado: TextInputType.text,
                        esconderTexto: _controllerView.blockPassword,
                        controller: _controllerView.controllerPassword,
                        icone: Icon(
                          Icons.lock,
                        ),
                        suficone: GestureDetector(
                          onTap: _controllerView.changeBLockPassword,
                          child: Icon(
                            _controllerView.blockPassword
                                ? Icons.remove_red_eye_outlined
                                : Icons.remove_red_eye_sharp,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 35,
                    left: 10,
                    right: 10,
                  ),
                  child: CustomButton(
                    width: double.infinity,
                    progress: _controllerView.progress,
                    title: "Entrar",
                    function: () {
                      _login(context);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 35,
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 2,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: CustomText(
                          texto: "Ou",
                          bold: true,
                          tamanhoFonte: 15,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.black,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 35,
                    left: 10,
                    right: 10,
                  ),
                  child: CustomButton(
                    width: double.infinity,
                    title: "Ainda não tem uma conta? Cadastre-se!",
                    buttonColor: Colors.blue[900],
                    function: () {
                      push(
                        context,
                        Signup(),
                      );
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 30,
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  child: CustomButton(
                    width: double.infinity,
                    title: "Esqueceu sua senha?",
                    function: () {
                      _rejectBuyAlert(
                        context,
                        "Digite o E-mail cadastrado:",
                        () {
                          _controllerView.resetPassword();
                        },
                      );
                    },
                    buttonColor: Colors.black,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _rejectBuyAlert(
    BuildContext context,
    String msg,
    Function function,
  ) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: CustomText(texto: msg),
            actions: [
              TextButton(
                child: CustomText(
                  texto: "Concluído",
                  cor: Colors.blue[800],
                  bold: true,
                ),
                onPressed: () async {
                  _controllerView.formKeyPasswordResetValidate();
                  if (_controllerView.formKeyPasswordResetIsValidate == true) {
                    Alert(msg: "Dentro de instantes uma mensagem com o link para alteração de sua senha será enviada para seu E-mail!")
                        .showDialog(context);
                    function();
                  }
                },
              ),
              TextButton(
                child: CustomText(
                  texto: "Cancelar",
                  cor: Colors.blue[800],
                  bold: true,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
            content: Form(
              key: _controllerView.formKeyPasswordReset,
              child: CustomTextForm(
                dicaCampo: "exemplo@exemplo.com",
                controller: _controllerView.controllerPasswordReset,
                validator: _controllerView.validatorEmailReset,
                acaoTeclado: TextInputAction.done,
                tipoTeclado: TextInputType.emailAddress,
              ),
            ),
          ),
        );
      },
    );
  }

  Future<dynamic> _login(BuildContext context) async {
    bool? response = await _controllerView.loginFunction();
    if (response != null) {
      response == false
          ? Alert(msg: _controllerView.errorMsg).showDialog(context)
          : push(context, HomeView(), replace: true);
    }
  }
}
