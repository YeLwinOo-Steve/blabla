import 'package:flutter/material.dart';
import 'package:innocence_baby/presentations/resources/color_manager.dart';
import 'package:innocence_baby/presentations/resources/routes_manager.dart';
import 'package:innocence_baby/presentations/resources/value_manager.dart';
import 'package:innocence_baby/presentations/widgets/custom_drop_down.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  int currentIndex = 0;
  List<String> images = [
    "https://ahead.ie/userfiles/images/linknetwork.jpg",
    "https://ahead.ie/userfiles/images/linknetwork.jpg",
    "https://ahead.ie/userfiles/images/linknetwork.jpg",
    "https://ahead.ie/userfiles/images/linknetwork.jpg",
  ];

  var items = [
    'S','M','L','XL'
  ];

  int countValue = 5;

  late String defaultValue;

  @override
  void initState() {
    defaultValue = items[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: ColorManager.ICON_COLOR_BLUE,
        ),
        backgroundColor: ColorManager.APPBAR_BACKGROUND_COLOR,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductSlide(
              onChanged: (int index) {
                setState(() => currentIndex = index);
              },
              imageCount: images.length,
              imagePath: images,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: indicators(images.length, currentIndex)),
            const SizedBox(height: AppSize.s10),
            Container(
              padding: const EdgeInsets.all(AppPadding.p10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Baby Shirt'),
                  SizedBox(height: AppSize.s10),
                  Text('Price - 5000 Ks'),
                  SizedBox(height: AppSize.s10),
                  Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s'),
                  SizedBox(height: AppSize.s10),
                  Text('Select Size'),
                  SizedBox(height: AppSize.s10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.2,
                        decoration: BoxDecoration(
                          color: ColorManager.PRIMARY,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CustomDropDown(items: items, defaultValue: defaultValue, onChanged: (String? newValue){
                          setState(() {
                            defaultValue = newValue!;
                          });
                        }),
                      ),
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: (){
                              setState(() {
                                countValue+= countValue;
                              });
                            }, icon: Icon(Icons.add)),
                            Text(countValue.toString()),
                            IconButton(onPressed: (){
                              setState(() {
                                countValue <= 0 ? countValue = 0 : countValue;
                              });
                            }, icon: Icon(Icons.remove)),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
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
                Navigator.pushNamed(context, AppRoutes.cart);
              },
              child: const Text(
                'Add to cart',
                style: TextStyle(color: ColorManager.TEXT_COLOR_BLACK),
              )),
        ),
      ),
    );
  }
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration:
          BoxDecoration(color: currentIndex == index ? ColorManager.PRIMARY : Colors.black26, shape: BoxShape.circle),
    );
  });
}

class ProductSlide extends StatelessWidget {
  final Function(int) onChanged;
  final int imageCount;
  final List<String> imagePath;

  const ProductSlide({required this.imagePath, required this.imageCount, required this.onChanged, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 240,
          child: PageView.builder(
              onPageChanged: onChanged,
              itemCount: imageCount,
              itemBuilder: (BuildContext context, int index) {
                return Image.network(imagePath[index], fit: BoxFit.cover);
              }),
        ),
        const SizedBox(height: AppSize.s20),
      ],
    );
  }
}
