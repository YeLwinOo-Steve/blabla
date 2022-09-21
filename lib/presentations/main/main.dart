import 'package:flutter/material.dart';
import 'package:innocence_baby/presentations/phone/phone.dart';
import 'package:innocence_baby/presentations/profile/profile.dart';
import 'package:innocence_baby/presentations/resources/color_manager.dart';
import 'package:innocence_baby/presentations/resources/icon_manager.dart';
import 'package:innocence_baby/presentations/resources/string_manager.dart';
import 'package:innocence_baby/presentations/search/search.dart';

import '../home/home.dart';
import '../resources/value_manager.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final List<Widget> _pages = const [
    HomeView(),
    SearchView(),
    PhoneView(),
    ProfileView(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          iconSize: AppSize.s20,
          backgroundColor: ColorManager.APPBAR_BACKGROUND_COLOR,
          selectedItemColor: ColorManager.ICON_COLOR_BLUE,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          items: [
            BottomNavigationBarItem(icon: const Icon(AppIcon.HOME), label: AppString.HOME.toUpperCase()),
            BottomNavigationBarItem(icon: const Icon(AppIcon.SEARCH), label: AppString.SEARCH.toUpperCase()),
            BottomNavigationBarItem(icon: const Icon(AppIcon.PHONE), label: AppString.PHONE.toUpperCase()),
            BottomNavigationBarItem(icon: const Icon(AppIcon.PROFILE), label: AppString.PROFILE.toUpperCase()),
          ],
        ));
  }
}
