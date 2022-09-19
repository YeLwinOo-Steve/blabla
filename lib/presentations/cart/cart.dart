import 'package:flutter/material.dart';
import 'package:innocence_baby/presentations/checkout/checkout.dart';
import 'package:innocence_baby/presentations/resources/color_manager.dart';
import 'package:innocence_baby/presentations/resources/string_manager.dart';
import 'package:innocence_baby/presentations/resources/value_manager.dart';

class CartView extends StatelessWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "https://picsum.photos/200/300",
      "https://picsum.photos/200/300",
      "https://picsum.photos/200/300",
      "https://picsum.photos/200/300",
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          AppString.MYCART,
          style: TextStyle(color: ColorManager.TEXT_COLOR_BLACK),
        ),
        iconTheme: const IconThemeData(color: ColorManager.BUTTON_BACKGROUND_COLOR_BLUE),
        elevation: 0,
        backgroundColor: ColorManager.APPBAR_BACKGROUND_COLOR,
      ),
      body: CardGridSection(images: images),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(AppPadding.p16),
        width: MediaQuery.of(context).size.width,
        height: 110,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text('Total'), Text('5000 Ks')],
            ),
            const SizedBox(height: AppSize.s4),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: ColorManager.TEXT_COLOR_BLUE.withOpacity(0.5),
                    minimumSize: Size(
                      MediaQuery.of(context).size.width,
                      40,
                    )),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const CheckoutView()));
                },
                child: const Text('Checkout',style: TextStyle(color: ColorManager.TEXT_COLOR_BLACK),))
          ],
        ),
      ),
    );
  }
}

class CardGridSection extends StatelessWidget {
  const CardGridSection({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          mainAxisExtent: 150,
        ),
        itemBuilder: (context, int index) {
          return CardCard(
            imagePath: images[index],
          );
        });
  }
}

class CardCard extends StatelessWidget {
  final String imagePath;

  const CardCard({required this.imagePath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p10),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 140,
            child: Image.network(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: AppSize.s10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Baby Shirt'),
              Text('Price : 5000 Ks'),
              Text('Total : 1'),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: ColorManager.BUTTON_BACKGROUND_COLOR_BLUE.withOpacity(0.5),
                ),
                onPressed: () {},
                child: const Text(
                  'Remove',
                  style: TextStyle(color: ColorManager.TEXT_COLOR_BLACK),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
