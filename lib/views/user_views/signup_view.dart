import 'package:app_mercado/controller/user_controllers/signup_controller/signup_controller.dart';
import 'package:app_mercado/custom_widgets/custom_buttons/custom_button.dart';
import 'package:app_mercado/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado/custom_widgets/custom_text/custom_text_form.dart';
import 'package:app_mercado/utils/alert.dart';
import 'package:app_mercado/utils/nav.dart';
import 'package:app_mercado/views/user_views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Signup extends StatelessWidget {
  final _controllerView = SignupController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          texto: "Cadastro",
        ),
      ),
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
                _infoPessoais(),
                _endereco(),
                Container(
                  margin: EdgeInsets.all(8),
                  child: CustomButton(
                    width: double.infinity,
                    title: "Cadastrar-se",
                    progress: _controllerView.progress,
                    function: () {
                      _signUp(context);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(8),
                  child: CustomButton(
                    width: double.infinity,
                    buttonColor: Colors.blue[900],
                    title: "Já tenho uma conta",
                    function: () {
                      push(context, LoginView(), replace: true);
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _infoPessoais() {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 14,
      child: Observer(
        builder: (_) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: CustomText(
                  texto: "Informações Pessoais",
                  bold: true,
                  tamanhoFonte: 16,
                  cor: Colors.green,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 8,
                  left: 5,
                  right: 5,
                ),
                child: CustomTextForm(
                  dicaCampo: "Nome completo",
                  controller: _controllerView.nameController,
                  validator: _controllerView.validatorNameField,
                  acaoTeclado: TextInputAction.next,
                  tipoTeclado: TextInputType.text,
                  icone: Icon(
                    Icons.supervised_user_circle,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 15,
                  left: 5,
                  right: 5,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: 10,
                      ),
                      alignment: Alignment.centerLeft,
                      child: CustomText(
                        texto: "Telefone:",
                        tamanhoFonte: 18,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          width: 120,
                          child: CustomTextForm(
                            dicaCampo: "ddd",
                            controller: _controllerView.dddController,
                            validator: _controllerView.validatorDddField,
                            acaoTeclado: TextInputAction.next,
                            tipoTeclado: TextInputType.phone,
                            maxLenght: 2,
                            icone: Icon(
                              Icons.phone,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(
                              left: 5,
                            ),
                            child: CustomTextForm(
                              dicaCampo: "Número",
                              controller:
                                  _controllerView.telephoneNumberController,
                              validator:
                                  _controllerView.validatorTelephoneNumberField,
                              acaoTeclado: TextInputAction.next,
                              tipoTeclado: TextInputType.phone,
                              maxLenght: 9,
                              icone: Icon(
                                Icons.phone,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 15,
                  left: 5,
                  right: 5,
                ),
                child: CustomTextForm(
                  dicaCampo: "E-mail",
                  controller: _controllerView.emailController,
                  validator: _controllerView.validatorEmailField,
                  acaoTeclado: TextInputAction.next,
                  tipoTeclado: TextInputType.emailAddress,
                  icone: Icon(
                    Icons.email,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 15,
                  left: 5,
                  right: 5,
                ),
                child: CustomTextForm(
                  dicaCampo: "Senha",
                  controller: _controllerView.passwordController,
                  validator: _controllerView.validatorPasswordField,
                  esconderTexto: true,
                  acaoTeclado: TextInputAction.next,
                  tipoTeclado: TextInputType.text,
                  icone: Icon(
                    Icons.lock,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 15,
                  left: 5,
                  right: 5,
                  bottom: 8,
                ),
                child: CustomTextForm(
                  dicaCampo: "Repita sua senha",
                  controller: _controllerView.repeatPasswordController,
                  validator: _controllerView.validatorRepeatPasswordField,
                  esconderTexto: true,
                  acaoTeclado: TextInputAction.done,
                  tipoTeclado: TextInputType.text,
                  icone: Icon(
                    Icons.lock,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  _endereco() {
    return Card(
      margin: EdgeInsets.all(8),
      elevation: 14,
      child: Observer(
        builder: (_) {
          return Column(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: CustomText(
                  texto: "Seu endereço",
                  bold: true,
                  tamanhoFonte: 16,
                  cor: Colors.green,
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 8,
                  left: 5,
                  right: 5,
                ),
                child: CustomTextForm(
                  dicaCampo: "Bairro",
                  controller: _controllerView.districtController,
                  validator: _controllerView.validatorAddresFields,
                  acaoTeclado: TextInputAction.next,
                  tipoTeclado: TextInputType.text,
                  icone: Icon(
                    Icons.edit_road,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 8,
                  left: 5,
                  right: 5,
                ),
                child: CustomTextForm(
                  dicaCampo: "Rua",
                  controller: _controllerView.roadController,
                  validator: _controllerView.validatorAddresFields,
                  acaoTeclado: TextInputAction.next,
                  tipoTeclado: TextInputType.text,
                  icone: Icon(
                    Icons.edit_road_outlined,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 8,
                  left: 5,
                  right: 5,
                ),
                child: CustomTextForm(
                  dicaCampo: "Número",
                  controller: _controllerView.numberHouseController,
                  validator: _controllerView.validatorAddresFields,
                  acaoTeclado: TextInputAction.next,
                  tipoTeclado: TextInputType.number,
                  icone: Icon(
                    Icons.edit_road_outlined,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 8,
                  left: 5,
                  right: 5,
                  bottom: 8,
                ),
                child: CustomTextForm(
                  dicaCampo: "Ponto de referência",
                  controller: _controllerView.referencePointController,
                  acaoTeclado: TextInputAction.done,
                  tipoTeclado: TextInputType.text,
                  icone: Icon(
                    Icons.edit_road_outlined,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<dynamic> _signUp(BuildContext context) async {
    bool? response = await _controllerView.signupFunction();

    if (response != null) {
      response == false
          ? Alert(msg: _controllerView.errorMsg).showDialog(context)
          : Alert(msg: "Cadastro realizado com sucesso!").showDialog(context);
    }
  }
}
