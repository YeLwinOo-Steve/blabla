import 'package:flutter/material.dart';
import 'package:innocence_baby/presentations/resources/color_manager.dart';
import 'package:innocence_baby/presentations/resources/string_manager.dart';
import 'package:innocence_baby/presentations/resources/value_manager.dart';
import 'package:innocence_baby/presentations/widgets/custom_drop_down.dart';
import 'package:innocence_baby/presentations/widgets/custom_text_field.dart';

import '../payment_method/payment_method.dart';

enum Payment { Kpay, WavePay, Bank }

class CheckoutView extends StatefulWidget {
  const CheckoutView({Key? key}) : super(key: key);

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  var items = [
    'TownShip',
    'Yangon',
  ];

  Payment? _payment = Payment.Kpay;

  late String defaultValue;

  @override
  void initState() {
    defaultValue = items[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            AppString.CHECKOUT_FORM,
            style: TextStyle(color: ColorManager.TEXT_COLOR_BLACK),
          ),
          iconTheme: const IconThemeData(color: ColorManager.BUTTON_BACKGROUND_COLOR_BLUE),
          elevation: 0,
          backgroundColor: ColorManager.APPBAR_BACKGROUND_COLOR,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomTextField(hintLabel: 'Name'),
                SizedBox(height: 20),
                CustomTextField(hintLabel: 'Phone Number', onlyNumber: true),
                SizedBox(height: 20),
                CustomTextField(hintLabel: 'Your Address', maxLine: 4),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration: BoxDecoration(
                          color: ColorManager.PRIMARY.withOpacity(0.5), borderRadius: BorderRadius.circular(5)),
                      child: CustomDropDown(
                          items: items,
                          defaultValue: defaultValue,
                          onChanged: (String? newValue) {
                            setState(() {
                              defaultValue = newValue!;
                            });
                          }),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 60,
                      decoration: BoxDecoration(
                          color: ColorManager.TEXT_FIELD_BACKGROUND_COLOR, borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text(
                        '2000 Ks',
                        style: Theme.of(context).textTheme.titleMedium,
                      )),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ListTile(
                  title: const Text('Kpay'),
                  leading: Radio<Payment>(
                    value: Payment.Kpay,
                    groupValue: _payment,
                    onChanged: (Payment? value) {
                      setState(() {
                        _payment = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('WavePay'),
                  leading: Radio<Payment>(
                    value: Payment.WavePay,
                    groupValue: _payment,
                    onChanged: (Payment? value) {
                      setState(() {
                        _payment = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('Bank'),
                  leading: Radio<Payment>(
                    value: Payment.Bank,
                    groupValue: _payment,
                    onChanged: (Payment? value) {
                      setState(() {
                        _payment = value;
                      });
                    },
                  ),
                ),
                Text(
                  'asdasd Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s',
                  style: TextStyle(color: ColorManager.TEXT_COLOR_RED),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: ColorManager.BUTTON_BACKGROUND_COLOR_BLUE.withOpacity(0.5),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const PaymentMethod()));
                },
                child: const Text(
                  'Add to cart',
                  style: TextStyle(color: ColorManager.TEXT_COLOR_BLACK),
                )),
          ),
        ),
      ),
    );
  }
}
