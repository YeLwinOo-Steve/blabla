import 'package:flutter/material.dart';
import 'package:innocence_baby/presentations/resources/color_manager.dart';
import 'package:innocence_baby/presentations/resources/icon_manager.dart';
import 'package:innocence_baby/presentations/resources/routes_manager.dart';
import 'package:innocence_baby/presentations/resources/value_manager.dart';

class SuccessfulView extends StatelessWidget {
  const SuccessfulView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(AppIcon.CHECK,size: 60,color: ColorManager.PRIMARY),
            const SizedBox(height: AppSize.s20),
            Text('Payment Successful',style: Theme.of(context).textTheme.titleLarge,),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: ColorManager.BUTTON_BACKGROUND_COLOR_BLUE,
              ),
              onPressed: () {
                Navigator.pushNamed(context,AppRoutes.home);
              },
              child: const Text(
                'Done',
                style: TextStyle(color: ColorManager.TEXT_COLOR_WHITE),
              )),
        ),
      ),
    );
  }
}
