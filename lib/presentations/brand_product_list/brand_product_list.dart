import 'package:flutter/material.dart';
import 'package:innocence_baby/presentations/home/home.dart';
import 'package:innocence_baby/presentations/resources/asset_manager.dart';
import 'package:innocence_baby/presentations/resources/color_manager.dart';
import 'package:innocence_baby/presentations/resources/icon_manager.dart';

class BrandProductView extends StatelessWidget {
  const BrandProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: ColorManager.PRIMARY,
        ),
        centerTitle: true,
        title: const SizedBox(height: 50,child: Image(image: AssetImage(ImageAssets.logo))),
        elevation: 0,
        backgroundColor: ColorManager.APPBAR_BACKGROUND_COLOR,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(AppIcon.CART, color: ColorManager.ICON_COLOR_BLUE),
          ),
        ],
      ),
      body: GridView.builder(
          itemCount: 20,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: 240,
          ),
          itemBuilder: (context, int index) {
            return NewArrivalCard(cardIndex: index);
          }),
    );
  }
}
