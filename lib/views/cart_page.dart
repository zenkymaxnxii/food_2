import 'package:flutter/material.dart';
import 'package:food/utils/app_colors.dart';
import 'package:food/widgets/app_custom_button.dart';
import 'package:food/widgets/app_custom_icon.dart';
import 'package:food/widgets/app_large_text.dart';
import 'package:food/widgets/app_small_text.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppCustomIcon(
                    iconData: Icons.arrow_back_ios,
                    padding: 8,
                    colorIcon: Colors.white,
                    backgroundColor: AppColors.mainColor,
                  ),
                  Wrap(
                    children: [
                      AppCustomIcon(
                        iconData: Icons.home,
                        colorIcon: Colors.white,
                        backgroundColor: AppColors.mainColor,
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      AppCustomIcon(
                        iconData: Icons.shopping_cart_outlined,
                        colorIcon: Colors.white,
                        backgroundColor: AppColors.mainColor,
                      ),
                    ],
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (_, index) {
                    return Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/image/food0.png',
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 100,
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppLargeText(text: 'Vietnam side'),
                                  AppSmallText(text: 'Spicy'),
                                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                    AppLargeText(
                                      text: "\$ 33.0",
                                      color: Colors.red,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(top: 4,bottom: 4,left: 7,right: 7),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFffffff),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                          children: [
                                            const Icon(Icons.remove,color: Colors.grey,),
                                            const SizedBox(width: 4,),
                                            AppLargeText(text: '5'),
                                            const SizedBox(width: 4,),
                                            const Icon(Icons.add,color: Colors.grey),
                                          ],
                                      ),
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
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
              width: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: AppLargeText(
                  text: '\$ 21751.0',
                ),
              ),
            ),
            AppCustomButton(
              text: "Check out",
              width: 130,
            ),
          ],
        ),
      ),
    );
  }
}
