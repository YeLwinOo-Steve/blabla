import 'package:flutter/material.dart';
import 'package:innocence_baby/presentations/resources/color_manager.dart';
import 'package:innocence_baby/presentations/resources/string_manager.dart';
import 'package:innocence_baby/presentations/resources/value_manager.dart';

import '../order_history/order_history.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.APPBAR_BACKGROUND_COLOR,
        iconTheme: const IconThemeData(
          color: ColorManager.PRIMARY,
        ),
        centerTitle: true,
        title: const Text(
          AppString.USER_PROFILE,
          style: TextStyle(color: ColorManager.TEXT_COLOR_BLUE),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppPadding.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network('https://picsum.photos/200/300', fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(height: AppSize.s20),
            const Text('Mg Mg'),
            const SizedBox(height: AppSize.s20),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: ColorManager.PRIMARY,
                  maximumSize: Size(MediaQuery.of(context).size.width, 48),
                  minimumSize: Size(MediaQuery.of(context).size.width, 48),
                ),
                onPressed: () {},
                child: const Text(AppString.SETTING, style: TextStyle(color: ColorManager.TEXT_COLOR_WHITE))),
            const SizedBox(height: AppSize.s20),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: ColorManager.PRIMARY,
                  maximumSize: Size(MediaQuery.of(context).size.width, 48),
                  minimumSize: Size(MediaQuery.of(context).size.width, 48),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderHistoryView()));
                },
                child: const Text(
                  AppString.ORDER_HISTORY,
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const OrderHistoryView()));
                },
                child: const Text(
                  AppString.LOGOUT,
                  style: TextStyle(color: ColorManager.TEXT_COLOR_WHITE),
                )),
          ],
        ),
      ),
    );
  }
}
