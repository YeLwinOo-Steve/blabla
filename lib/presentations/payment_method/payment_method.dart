import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:innocence_baby/presentations/resources/asset_manager.dart';
import 'package:innocence_baby/presentations/resources/color_manager.dart';
import 'package:innocence_baby/presentations/resources/string_manager.dart';
import 'package:innocence_baby/presentations/resources/value_manager.dart';

import '../successful/successful.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  static const snackBar = SnackBar(content: Text('Copied to Clipboard'));
  static const String number = '09919919911';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          AppString.PAYMENT_METHOD,
          style: TextStyle(color: ColorManager.TEXT_COLOR_BLACK),
        ),
        iconTheme: const IconThemeData(color: ColorManager.BUTTON_BACKGROUND_COLOR_BLUE),
        elevation: 0,
        backgroundColor: ColorManager.APPBAR_BACKGROUND_COLOR,
      ),
      body: Container(
        padding: EdgeInsets.all(AppPadding.p10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Image(image: AssetImage(ImageAssets.logo)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Wave Money', style: Theme.of(context).textTheme.titleMedium),
                      Text(number, style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                  TextButton(
                      onPressed: () {
                        Clipboard.setData(const ClipboardData(text: number)).then((value) {
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      },
                      child: Text('Copy'))
                ],
              ),
            ),
            SizedBox(height: AppSize.s20),
            Text(AppString.UPLOAD_PAYMENT_SCREENSHOT),
            SizedBox(height: AppSize.s20),
            TextButton(
                style:
                    TextButton.styleFrom(backgroundColor: ColorManager.BUTTON_BACKGROUND_COLOR_BLUE.withOpacity(0.5)),
                onPressed: () {},
                child: const Text(
                  'Upload Image',
                  style: TextStyle(color: ColorManager.TEXT_COLOR_WHITE),
                )),
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const SuccessfulView()));
              },
              child: const Text(
                'Order Review',
                style: TextStyle(color: ColorManager.TEXT_COLOR_WHITE),
              )),
        ),
      ),
    );
  }
}
