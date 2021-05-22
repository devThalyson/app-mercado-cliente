import 'package:app_mercado/controller/user_controllers/user_details_controller/user_details_controller.dart';
import 'package:app_mercado/custom_widgets/custom_buttons/custom_button.dart';
import 'package:app_mercado/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado/custom_widgets/custom_text/custom_text_form.dart';
import 'package:app_mercado/utils/alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ContactAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controllerView = Provider.of<UserDetailsController>(context);
    _controllerView.clearContactAdminFields();

    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          texto: "Fale Conosco",
          bold: true,
        ),
        centerTitle: true,
      ),
      body: _body(_controllerView, context),
    );
  }

  _body(UserDetailsController _controllerView, BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        child: Observer(
          builder: (_) {
            return Form(
              key: _controllerView.contactAdminFormKey,
              child: Column(
                children: [
                  Card(
                    child: Container(
                      margin: EdgeInsets.all(5),
                      child: CustomText(
                        texto:
                            "Tem um problema ou deseja sugerir melhorias para o App? Nos mande uma mensagem!",
                        tamanhoFonte: 20,
                      ),
                    ),
                    elevation: 10,
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    color: Colors.grey[200],
                    child: CustomTextForm(
                      dicaCampo: "Assunto",
                      acaoTeclado: TextInputAction.next,
                      tipoTeclado: TextInputType.text,
                      controller: _controllerView.subjectController,
                      validator: _controllerView.validatorAddresFields,
                      suficone: Icon(
                        Icons.subject,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(5),
                    color: Colors.grey[200],
                    height: 450,
                    child: CustomTextForm(
                      dicaCampo: "Digite sua mensagem",
                      controller: _controllerView.bodyController,
                      validator: _controllerView.validatorAddresFields,
                      suficone: Icon(Icons.mail),
                      maxLines: null,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5),
                    child: CustomButton(
                      title: "Enviar mensagem",
                      progress: _controllerView.progress,
                      width: double.infinity,
                      function: () {
                        _controllerView.checkFormContactAdminValidate();
                        if (_controllerView.contactAdminFormValidate == true) {
                          _sendMensage(_controllerView, context);
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  _sendMensage(
      UserDetailsController _controllerView, BuildContext context) async {
    await _controllerView.contacAdmin();

    if (_controllerView.contactAdminMsg!.isNotEmpty) {
      Alert(
        msg: _controllerView.contactAdminMsg!,
      ).showDialog(context);
    }
  }
}
