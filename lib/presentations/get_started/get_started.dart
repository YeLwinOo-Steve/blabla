import 'package:flutter/material.dart';
import 'package:innocence_baby/presentations/resources/asset_manager.dart';
import 'package:innocence_baby/presentations/resources/color_manager.dart';
import 'package:innocence_baby/presentations/resources/routes_manager.dart';
import 'package:innocence_baby/presentations/resources/string_manager.dart';
import 'package:innocence_baby/presentations/resources/style_manager.dart';
import 'package:innocence_baby/presentations/resources/value_manager.dart';
import '../auth/login.dart';
import '../widgets/custom_drop_down.dart';

class GetStartedView extends StatefulWidget {
  const GetStartedView({Key? key}) : super(key: key);

  @override
  State<GetStartedView> createState() => _GetStartedViewState();
}

class _GetStartedViewState extends State<GetStartedView> {
  late String defaultValue;
  var items = ['Myanmar', 'English'];

  @override
  void initState() {
    defaultValue = items[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  width: 180,
                  height: 180,
                  child: Image(
                    image: AssetImage(ImageAssets.logo),
                  ),
                ),
                Text(
                  AppString.WELCOME,
                  style: ApplicationTheme().textTheme.titleMedium,textAlign: TextAlign.center
                ),
                Text(AppString.WELCOMEDESCRIPTION,
                    style: ApplicationTheme().textTheme.bodySmall, textAlign: TextAlign.center),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10, vertical: 0),
                  width: MediaQuery.of(context).size.width * 0.36,
                  decoration: BoxDecoration(
                      color: ColorManager.BUTTON_BACKGROUND_COLOR_BLUE,
                      borderRadius: BorderRadius.circular(RadiusManager.r10)),
                  child: CustomDropDown(
                      items: items,
                      defaultValue: defaultValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          defaultValue = newValue!;
                        });
                      }),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: ColorManager.ICON_COLOR_BLUE,
                      minimumSize: Size(MediaQuery.of(context).size.width, AppSize.s48),
                      maximumSize: Size(MediaQuery.of(context).size.width, AppSize.s48),
                    ),
                    onPressed: () {
                      // Navigator.pushNamed(context, AppRoutes.home);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const LoginView()));
                    },
                    child: Text(
                      AppString.GETSTARTED,
                      style: ApplicationTheme().textTheme.bodySmall!.copyWith(color: ColorManager.TEXT_COLOR_WHITE),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
