import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:innocence_baby/presentations/brand_product_list/brand_product_list.dart';
import 'package:innocence_baby/presentations/product_details/product_details.dart';
import 'package:innocence_baby/presentations/resources/asset_manager.dart';
import 'package:innocence_baby/presentations/resources/color_manager.dart';
import 'package:innocence_baby/presentations/resources/icon_manager.dart';
import 'package:innocence_baby/presentations/resources/routes_manager.dart';
import 'package:innocence_baby/presentations/resources/string_manager.dart';
import 'package:innocence_baby/presentations/resources/value_manager.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> images = [
      "https://ahead.ie/userfiles/images/linknetwork.jpg",
      "https://ahead.ie/userfiles/images/linknetwork.jpg",
      "https://ahead.ie/userfiles/images/linknetwork.jpg",
      "https://ahead.ie/userfiles/images/linknetwork.jpg",
    ];
    return Scaffold(
      backgroundColor: ColorManager.SCAFFOLD_COLOR,
      appBar: AppBar(
        centerTitle: true,
        title: const SizedBox(height: 50,child: Image(image: AssetImage(ImageAssets.logo))),
        elevation: 0,
        backgroundColor: ColorManager.APPBAR_BACKGROUND_COLOR,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.cart);
            },
            icon: const Icon(AppIcon.CART, color: ColorManager.ICON_COLOR_BLUE),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCarouselSlider(
                  onChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  imageList: images),
              const SizedBox(height: AppSize.s10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: indicators(images.length, currentIndex)),
              const SizedBox(height: AppSize.s10),
              Text(AppString.BRAND,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500)),
              const SizedBox(height: AppSize.s20),
              const BrandGridSection(),
              const SizedBox(height: AppSize.s10),
              Text(AppString.NEW_ARRIVAL,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500)),
              const SizedBox(height: AppSize.s20),
              const NewArrivalGridSection(),
            ],
          ),
        ),
      ),
    );
  }
}

class NewArrivalGridSection extends StatelessWidget {
  const NewArrivalGridSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 500,
        child: GridView.builder(
            itemCount: 4,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 240,
            ),
            itemBuilder: (context, int index) {
              return NewArrivalCard(cardIndex: index);
            }),
      ),
    );
  }
}

class BrandGridSection extends StatelessWidget {
  const BrandGridSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: GridView.builder(
            itemCount: 8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              mainAxisExtent: 90,
            ),
            itemBuilder: (context, int index) {
              return BrandCard(
                cardIndex: index,
              );
            }),
      ),
    );
  }
}

class BrandCard extends StatelessWidget {
  final int cardIndex;

  const BrandCard({
    required this.cardIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const BrandProductView()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [const Icon(Icons.shield), Text('Brand $cardIndex')],
        ),
      ),
    );
  }
}

class NewArrivalCard extends StatelessWidget {
  final int cardIndex;

  const NewArrivalCard({
    required this.cardIndex,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const ProductDetailsView()));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 180,
            child: Image.network('https://picsum.photos/200/300', fit: BoxFit.cover),
          ),
          const Text(
              'High neck t shirt for baby High neck t shirt for baby High neck t shirt for baby High neck t shirt for baby',
              overflow: TextOverflow.ellipsis),
          const Text('Price - 5000Ks')
        ],
      ),
    );
  }
}

class CustomCarouselSlider extends StatelessWidget {
  dynamic Function(int, CarouselPageChangedReason)? onChanged;
  final List<String> imageList;

  CustomCarouselSlider({
    required this.onChanged,
    required this.imageList,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        onPageChanged: onChanged,
        height: 180.0,
        autoPlay: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.easeIn,
      ),
      items: imageList.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: AppPadding.p5, vertical: AppPadding.p10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(RadiusManager.r10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(RadiusManager.r10),
                child: Image.network(image, fit: BoxFit.cover),
              ),
            );
          },
        );
      }).toList(),
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
