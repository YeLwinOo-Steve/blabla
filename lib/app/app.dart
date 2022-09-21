import 'package:flutter/material.dart';
import 'package:innocence_baby/presentations/resources/routes_manager.dart';
import 'package:get/get.dart';
import '../presentations/get_started/get_started.dart';
import 'app_binding.dart';

class InnocenceBabyApp extends StatelessWidget {
  const InnocenceBabyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      onGenerateRoute: RouteGenerator.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
       home: const GetStartedView(),
    );
  }
}
