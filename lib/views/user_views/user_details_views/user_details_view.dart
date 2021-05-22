import 'package:app_mercado/controller/buys_controllers/client_buys_controller/client_buys_controller.dart';
import 'package:app_mercado/controller/user_controllers/user_details_controller/user_details_controller.dart';
import 'package:app_mercado/custom_widgets/custom_text/custom_text.dart';
import 'package:app_mercado/utils/alert.dart';
import 'package:app_mercado/utils/nav.dart';
import 'package:app_mercado/views/user_views/login_view.dart';
import 'package:app_mercado/views/user_views/user_details_views/contact_admin.dart';
import 'package:app_mercado/views/user_views/user_details_views/user_alter_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class UserDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _controllerView = Provider.of<UserDetailsController>(context);

    if (_controllerView.cliente == null) {
      _controllerView.getClient();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          texto: "Meus dados",
          bold: true,
        ),
      ),
      body: _body(_controllerView, context),
    );
  }

  _body(UserDetailsController _controllerView, BuildContext context) {
    return SingleChildScrollView(
      child: Observer(
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _clientWelcomes(_controllerView),
              _contactModes(
                context,
              ),
              _exitToApp(context, _controllerView),
            ],
          );
        },
      ),
    );
  }

  _clientWelcomes(UserDetailsController _controllerView) {
    return Container(
      width: double.infinity,
      child: Card(
        elevation: 10,
        margin: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(5),
              child: CustomText(
                texto: "Olá, seja bem-vindo (a)",
                bold: true,
                cor: Colors.green[900],
                tamanhoFonte: 35,
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: CustomText(
                texto: _controllerView.cliente != null
                    ? _controllerView.cliente!.nome!
                    : "",
                bold: true,
                cor: Colors.black,
                tamanhoFonte: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _contactModes(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.only(
          left: 5,
          right: 5,
          top: 10,
          bottom: 15,
        ),
        elevation: 10,
        child: Column(
          children: [
            _userDetailsTile(Icons.email, "Fale Conosco", () {
              push(context, ContactAdmin());
            }),
            _userDetailsTile(Icons.star, "Nos Avalie", () {}),
            _userDetailsTile(
                Icons.privacy_tip_outlined, "Política de Privacidade", () {}),
          ],
        ),
      ),
    );
  }

  _exitToApp(BuildContext context, UserDetailsController _controllerView) {
    return Container(
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.only(
          left: 5,
          right: 5,
          top: 10,
          bottom: 5,
        ),
        elevation: 10,
        child: Column(
          children: [
            _userDetailsTile(
              Icons.alternate_email,
              "Alterar dados",
              () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return UserAlterData();
                  },
                );
              },
            ),
            _userDetailsTile(
                Icons.device_unknown_outlined, "Sobre o Desenvolvedor", () {}),
            _userDetailsTile(
              Icons.exit_to_app,
              "Sair da Conta",
              () async {
                Alert(
                  msg: "Tem certeza que deseja sair da sua conta?",
                  okOrNot: true,
                  function: () {
                    _controllerView.clearCachedClient();
                    Provider.of<ClientBuysController>(context, listen: false)
                        .setLoadBuys();
                  },
                  push: true,
                  pushWidget: LoginView(),
                ).showDialog(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  _userDetailsTile(IconData icon, String text, Function function) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            left: 5,
            right: 5,
            top: 15,
            bottom: 15,
          ),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.all(5),
                child: Icon(
                  icon,
                  size: 25,
                  color: Colors.green[900],
                ),
              ),
              GestureDetector(
                onTap: () {
                  function();
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  child: CustomText(
                    texto: text,
                    bold: true,
                    tamanhoFonte: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Divider(
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
