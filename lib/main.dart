import 'package:app_mercado/controller/buys_controllers/buys_cart_controller/buys_cart_controller.dart';
import 'package:app_mercado/controller/buys_controllers/client_buys_controller/client_buys_controller.dart';
import 'package:app_mercado/controller/categorys_controllers/categorys_controller.dart';
import 'package:app_mercado/controller/user_controllers/user_details_controller/user_details_controller.dart';
import 'package:app_mercado/utils/web_socket.dart';
import 'package:app_mercado/views/user_views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<BuysCartController>(
          create: (context) => BuysCartController(),
        ),
        Provider<ClientBuysController>(
          create: (context) => ClientBuysController(),
        ),
        Provider<CategorysController>(
          create: (context) => CategorysController(),
        ),
        Provider<UserDetailsController>(
          create: (context) => UserDetailsController(),
        ),
        Provider<WebSocket>(
          create: (context) => WebSocket(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App Mercado',
        theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: ('Google'),
        ),
        builder: (context, widget) => ResponsiveWrapper.builder(
          BouncingScrollWrapper.builder(
            context,
            widget!,
          ),
          maxWidth: 1200,
          minWidth: 450,
          defaultScale: true,
          breakpoints: [
            ResponsiveBreakpoint.autoScale(450, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
            ResponsiveBreakpoint.autoScale(1200, name: DESKTOP),
            ResponsiveBreakpoint.autoScale(2460, name: "4K"),
          ],
        ),
        home: SplashScreen(),
      ),
    );
  }
}
