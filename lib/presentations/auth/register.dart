import 'package:flutter/material.dart';
import 'package:innocence_baby/presentations/auth/register.dart';
import 'package:innocence_baby/presentations/resources/color_manager.dart';
import 'package:innocence_baby/presentations/resources/routes_manager.dart';
import 'package:innocence_baby/presentations/resources/value_manager.dart';
import '../resources/string_manager.dart';

import '../resources/style_manager.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    Text(AppString.REGISTER,
                        style: ApplicationTheme().textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center),
                    const SizedBox(height: AppSize.s48),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Phone Number',
                        prefixIcon: Icon(Icons.account_circle),
                      ),
                    ),
                    const SizedBox(height: AppSize.s20),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                      ),
                    ),
                    const SizedBox(height: AppSize.s20),
                    const TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm Password',
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
                          Navigator.pushNamed(context, AppRoutes.home);
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
