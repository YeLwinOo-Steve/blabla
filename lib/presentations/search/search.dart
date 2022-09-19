import 'package:flutter/material.dart';
import 'package:innocence_baby/presentations/resources/color_manager.dart';
import 'package:innocence_baby/presentations/resources/value_manager.dart';

import '../home/home.dart';
import '../widgets/custom_drop_down.dart';

class SearchView extends StatefulWidget {

  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  late String defaultValue;
  var items = [
    'Nike',
    'Jordan',
  ];
  @override
  void initState() {
    defaultValue = items[0];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(AppPadding.p6),
                  width: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    color: ColorManager.BUTTON_BACKGROUND_COLOR_BLUE,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: CustomDropDown(items: items, defaultValue: defaultValue, onChanged: (String? newValue){
                    setState(() {
                      defaultValue = newValue!;
                    });
                  }),
                ),
                const SizedBox(height: AppSize.s20),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 20,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      mainAxisExtent: 240,
                    ),
                    itemBuilder: (context, int index) {
                      return NewArrivalCard(cardIndex: index);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
