import 'package:flutter/material.dart';
import 'package:food/data/product_api.dart';
import 'package:food/models/products.dart';
import 'package:food/utils/app_colors.dart';
import 'package:food/widgets/app_custom_button.dart';
import 'package:food/widgets/app_custom_icon.dart';
import 'package:food/widgets/app_icon_text.dart';
import 'package:food/widgets/app_large_text.dart';
import 'package:food/widgets/app_small_text.dart';
import 'package:food/widgets/expanded_text.dart';

class RecommendedFoodPage extends StatefulWidget {
  RecommendedFoodPage({Key? key, required this.productRecommended})
      : super(key: key);
  ProductsModel productRecommended;
  @override
  State<RecommendedFoodPage> createState() => _RecommendedFoodPageState();
}

class _RecommendedFoodPageState extends State<RecommendedFoodPage> {
  int quality = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            right: 0,
            left: 0,
            child: Container(
                height: 360,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(ProductApi.base_url +
                          '/uploads/' +
                          widget.productRecommended.img!),
                      fit: BoxFit.cover),
                )),
          ),
          Positioned(
              top: 45,
              left: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: AppCustomIcon(
                      iconData: Icons.arrow_back_ios,
                      padding: 8,
                    ),
                  ),
                  AppCustomIcon(
                    iconData: Icons.shopping_cart_outlined,
                    padding: 2,
                  ),
                ],
              )),
          Positioned(
            top: 345,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLargeText(text: widget.productRecommended.name!),
                    const SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: [
                        Row(
                          children: List.generate(
                              widget.productRecommended.stars!,
                              (index) => Icon(
                                    Icons.star,
                                    color: AppColors.mainColor,
                                    size: 15,
                                  )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        AppSmallText(text: '4.5'),
                        const SizedBox(
                          width: 10,
                        ),
                        AppSmallText(text: '1287 comments'),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppIconText(
                          text: 'Normal',
                          iconData: Icons.circle,
                          colorIcon: AppColors.iconColor1,
                          colorText: AppColors.mainColor,
                          sizeIcon: 20,
                        ),
                        AppIconText(
                          text: '1.7 km',
                          iconData: Icons.location_on,
                          colorIcon: AppColors.mainColor,
                          colorText: AppColors.mainColor,
                          sizeIcon: 20,
                        ),
                        AppIconText(
                          text: '32 min',
                          iconData: Icons.alarm_rounded,
                          colorIcon: AppColors.iconColor2,
                          colorText: AppColors.mainColor,
                          sizeIcon: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppLargeText(text: 'Introduce'),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                          child: ExpandedText(
                              color: Colors.black54,
                              text: widget.productRecommended.description!)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding:
            const EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Color(0xFFf7f6f4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(quality>0) setQuality(false);
                    },
                    child: const Icon(
                      Icons.remove,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  AppLargeText(text: quality.toString()),
                  const SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: (){
                      setQuality(true);
                    },
                    child: const Icon(
                      Icons.add,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            AppCustomButton(
              text: '\$${widget.productRecommended.price!*quality} Add to cart',
              width: 200,
            ),
          ],
        ),
      ),
    );
  }
  void setQuality(bool isArrow){
    setState(() {
      isArrow?quality++:quality--;
    });
  }
}
