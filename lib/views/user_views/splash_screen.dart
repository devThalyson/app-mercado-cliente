import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:app_mercado/model/cliente.dart';
import 'package:app_mercado/views/home_views/home_view.dart';
import 'package:app_mercado/views/user_views/login_view.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen.withScreenFunction(
      splash: "assets/images/logo.png",
      animationDuration: Duration(seconds: 2),
      screenFunction: () async {
        Cliente? cliente = await Cliente.get();
        return cliente != null ? HomeView() : LoginView();
      },
      splashTransition: SplashTransition.sizeTransition,
      duration: 2000,
      pageTransitionType: PageTransitionType.leftToRight,
    );
  }
}
