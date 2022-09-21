import 'package:flutter/material.dart';
import 'package:innocence_baby/presentations/cart/cart.dart';
import 'package:innocence_baby/presentations/get_started/get_started.dart';
import 'package:innocence_baby/presentations/resources/string_manager.dart';

import '../main/main.dart';

class AppRoutes{
  static const String getStarted = '/getStarted';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String productDetails = '/productDetail';
  static const String cart = '/cart';
  static const String checkoutForm = '/checkoutForm';
  static const String payment = '/payment';
}

class RouteGenerator{
  static Route<dynamic> onGenerateRoute(RouteSettings routeSettings){
    switch(routeSettings.name){
      case AppRoutes.getStarted:
        return MaterialPageRoute(builder: (_)=> const GetStartedView());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_)=> const MainView());
      case AppRoutes.cart:
        return MaterialPageRoute(builder: (_)=> const CartView());
      default:
        return MaterialPageRoute(builder: (_) => const ErrorView());
    }
  }
}

class ErrorView extends StatelessWidget {
  const ErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      const Scaffold(
        body: Text(AppString.ERROR),
      );
  }
}