import 'package:app_mercado/controller/user_controllers/user_details_controller/user_details_controller.dart';
import 'package:app_mercado/custom_widgets/custom_buttons/custom_button.dart';
import 'package:app_mercado/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado/custom_widgets/custom_text/custom_text_form.dart';
import 'package:app_mercado/utils/alert.dart';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class AlterAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controllerView = Provider.of<UserDetailsController>(context);
    _controllerView.catchClientAddress();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          texto: "Alterar Endereço",
          bold: true,
        ),
      ),
      body: _body(_controllerView, context),
    );
  }

  _body(UserDetailsController _controllerView, BuildContext context) {
    return Form(
      key: _controllerView.addressFormKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.all(8),
              elevation: 14,
              child: Observer(
                builder: (_) {
                  return Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5),
                        child: CustomText(
                          texto: "Atual Endereço Cadastrado",
                          bold: true,
                          tamanhoFonte: 16,
                          cor: Colors.green,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(
                          top: 8,
                          left: 15,
                          right: 5,
                        ),
                        child: CustomText(
                          texto: "Bairro: ",
                          tamanhoFonte: 18,
                          bold: true,
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
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(
                          top: 8,
                          left: 15,
                          right: 5,
                        ),
                        child: CustomText(
                          texto: "Rua: ",
                          tamanhoFonte: 18,
                          bold: true,
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
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(
                          top: 8,
                          left: 15,
                          right: 5,
                        ),
                        child: CustomText(
                          texto: "Número da casa: ",
                          tamanhoFonte: 18,
                          bold: true,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 8,
                          left: 5,
                          right: 5,
                        ),
                        child: CustomTextForm(
                          dicaCampo: "Número da casa",
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
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(
                          top: 8,
                          left: 15,
                          right: 5,
                        ),
                        child: CustomText(
                          texto: "Ponto de referência: ",
                          tamanhoFonte: 18,
                          bold: true,
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
                      Container(
                        margin: EdgeInsets.all(8),
                        child: CustomButton(
                          width: double.infinity,
                          title: "Atualizar Endereço",
                          progress: _controllerView.progress,
                          function: () {
                            _updateClientAddress(context, _controllerView);
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _updateClientAddress(
      BuildContext context, UserDetailsController _controllerView) async {
    Alert(
      msg: "Tem certeza que deseja atualizar seu endereço?",
      okOrNot: true,
      function: () async {
        await _controllerView.updateClientAddress();

        if (_controllerView.addressErrorMsg.isEmpty) {
          if (_controllerView.addressFormValidate == true) {
            Alert(
              msg: "Endereço atualizado com sucesso!",
            ).showDialog(context);
          }
        } else {
          Alert(
            msg: _controllerView.addressErrorMsg,
          ).showDialog(context);
        }
      },
    ).showDialog(context);
  }
}
