import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innocence_baby/domain/controller.dart';
import 'package:innocence_baby/presentations/auth/register.dart';
import 'package:innocence_baby/presentations/resources/color_manager.dart';
import 'package:innocence_baby/presentations/resources/value_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/string_manager.dart';

import '../resources/style_manager.dart';

class LoginView extends StatelessWidget {

  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AccountController controller = Get.find();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();


    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(AppString.APPNAME,
                        style: ApplicationTheme().textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center),
                    const SizedBox(height: AppSize.s48),
                    TextField(
                      controller: phoneController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number',
                        prefixIcon: Icon(Icons.account_circle),
                      ),
                    ),
                    const SizedBox(height: AppSize.s20),
                    TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                    const SizedBox(height: AppSize.s20),
                    TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: ColorManager.PRIMARY,
                          maximumSize: Size(MediaQuery.of(context).size.width, 48),
                          minimumSize: Size(MediaQuery.of(context).size.width, 48),
                        ),
                        onPressed: () {
                          controller.phone = phoneController.text.trim();
                          controller.password = passwordController.text.trim();
                          controller.logIn(context: context);
                        },
                        child: const Text(
                          AppString.LOGIN,
                          style: TextStyle(color: ColorManager.TEXT_COLOR_WHITE),
                        )),
                    const SizedBox(height: AppSize.s20),
                    TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: ColorManager.PRIMARY,
                          maximumSize: Size(MediaQuery.of(context).size.width, 48),
                          minimumSize: Size(MediaQuery.of(context).size.width, 48),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterView()));
                        },
                        child: const Text(
                          AppString.REGISTER,
                          style: TextStyle(color: ColorManager.TEXT_COLOR_WHITE),
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
