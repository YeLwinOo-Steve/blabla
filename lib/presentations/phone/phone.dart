import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:innocence_baby/presentations/resources/asset_manager.dart';
import 'package:innocence_baby/presentations/resources/color_manager.dart';
import 'package:innocence_baby/presentations/resources/string_manager.dart';
import 'package:innocence_baby/presentations/resources/value_manager.dart';
import 'package:flutter_svg/svg.dart';

class PhoneView extends StatelessWidget {
  const PhoneView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const snackBar = SnackBar(content: Text('Copied to Clipboard'));
    var phoneNumber = [
      '09919912312',
      '09919912312',
      '09919912312',
      '09919912312',
    ];
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(AppPadding.p10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppString.PHONENUMBER,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500)),
              const SizedBox(height: AppSize.s20),
              Wrap(
                direction: Axis.horizontal,
                spacing: AppSize.s40,
                runSpacing: AppSize.s20,
                children: phoneNumber
                    .map((number) => GestureDetector(
                        onTap: () {
                          Clipboard.setData(ClipboardData(text: number)).then((value) {
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          });
                        },
                        child: Text(
                          number,
                          style: const TextStyle(color: ColorManager.TEXT_COLOR_BLUE),
                        )))
                    .toList(),
              ),
              const SizedBox(height: AppSize.s20),
              Text(AppString.SOCIALMEDIA,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500)),
              const SizedBox(height: AppSize.s20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.facebook, color: ColorManager.ICON_COLOR_BLUE, size: AppSize.s40)),
                  const SizedBox(width: AppSize.s20),
                  IconButton(
                      onPressed: () {},
                      icon: SizedBox(
                        width: AppSize.s60,
                        height: AppSize.s60,
                        child: SvgPicture.asset(
                          ImageAssets.viber,
                        ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
