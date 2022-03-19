import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food/data/product_api.dart';
import 'package:food/models/products.dart';
import 'package:food/utils/app_colors.dart';
import 'package:food/views/popular_food_page.dart';
import 'package:food/views/recommended_food_page.dart';
import 'package:food/widgets/app_icon_text.dart';
import 'package:food/widgets/app_large_text.dart';
import 'package:food/widgets/app_small_text.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, required this.popularProductList, required this.recommendedProductList}) : super(key: key);

  List<ProductsModel> popularProductList;
  List<ProductsModel> recommendedProductList;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFf9f9fb),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(left: 20, right: 20),
          // color: Colors.red,
          child: Column(
            children: [
              _headFoodBody(),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    _slidePopularFood(),
                    _listRecommendedFood(),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  Widget _headFoodBody() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              AppLargeText(
                text: 'Vietnam',
                color: AppColors.mainColor,
              ),
              Row(
                children: [
                  AppSmallText(
                    text: 'Hanoi',
                    color: Colors.black,
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    size: 15,
                  ),
                ],
              )
            ],
          ),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: AppColors.mainColor,
            ),
            child: const Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _slidePopularFood() {
    PageController _pageController = PageController(viewportFraction: 0.9);
    Matrix4 _matrix = Matrix4.identity();
    double _scaleFactor = 0.8;
    double _currentScale;
    double _currentTransform;

    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
        // print(_currentPage);
      });
    });

    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return PopularFoodPage(popularProduct: widget.popularProductList[_currentPage.toInt()]);
        }));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        height: 310,
        child: Column(children: [
          SizedBox(
            height: 280,
            child: PageView.builder(
                controller: _pageController,
                itemCount: widget.popularProductList.length,
                itemBuilder: (_, index) {
                  if (index == _currentPage.floor()) {
                    _currentScale =
                        1 - (_currentPage - index) * (1 - _scaleFactor);
                    _currentTransform = 200 * (1 - _currentScale) / 2;
                    _matrix = Matrix4.diagonal3Values(1, _currentScale, 1)
                      ..setTranslationRaw(0, _currentTransform, 1);
                  } else if (index == _currentPage.floor() + 1) {
                    _currentScale = _scaleFactor +
                        (_currentPage - index + 1) * (1 - _scaleFactor);
                    _currentTransform = 200 * (1 - _currentScale) / 2;
                    _matrix = Matrix4.diagonal3Values(1, _currentScale, 1)
                      ..setTranslationRaw(0, _currentTransform, 1);
                  } else if (index == _currentPage.floor() - 1) {
                    _currentScale =
                        1 - (_currentPage - index) * (1 - _scaleFactor);
                    _currentTransform = 200 * (1 - _currentScale) / 2;
                    _matrix = Matrix4.diagonal3Values(1, _currentScale, 1)
                      ..setTranslationRaw(0, _currentTransform, 1);
                  } else {
                    _currentScale = 0.8;
                    _matrix = Matrix4.diagonal3Values(1, _currentScale, 1)
                      ..setTranslationRaw(0, 200 * (1 - _scaleFactor) / 2, 1);
                  }

                  return Container(
                    margin: const EdgeInsets.only(left: 8, right: 8),
                    child: Transform(
                      transform: _matrix,
                      child: Stack(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.red,
                                image: DecorationImage(
                                    image: NetworkImage(ProductApi.base_url+'/uploads/'+widget.popularProductList[index].img!),
                                    fit: BoxFit.cover)),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            right: 20,
                            child: Container(
                              height: 130,
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 5),
                                    color: Color(0xFFe8e8e8),
                                    blurRadius: 5,
                                  ),
                                  BoxShadow(
                                    offset: Offset(-5, 0),
                                    color: Colors.white,
                                  ),
                                  BoxShadow(
                                    offset: Offset(5, 0),
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppLargeText(text: widget.popularProductList[index].name!),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: List.generate(
                                            widget.popularProductList[index].stars!,
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
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppIconText(
                                        text: 'Normal',
                                        iconData: Icons.circle,
                                        colorIcon: AppColors.iconColor1,
                                        colorText: AppColors.mainColor,
                                      ),
                                      AppIconText(
                                        text: '1.7 km',
                                        iconData: Icons.location_on,
                                        colorIcon: AppColors.mainColor,
                                        colorText: AppColors.mainColor,
                                      ),
                                      AppIconText(
                                        text: '32 min',
                                        iconData: Icons.alarm_rounded,
                                        colorIcon: AppColors.iconColor2,
                                        colorText: AppColors.mainColor,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          DotsIndicator(
            position: _currentPage,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape:
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            dotsCount: widget.popularProductList.length,
          ),
        ]),
        // color: Colors.red,
      ),
    );
  }

  Widget _listRecommendedFood() {
    return Container(
      height: (widget.recommendedProductList.length+1) * 120,
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      child: Column(
        children: [
          Row(
            children: [
              AppLargeText(text: 'Recommended'),
              const SizedBox(
                width: 8,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: AppLargeText(
                  text: '.',
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                  margin: const EdgeInsets.only(top: 2),
                  child: AppSmallText(text: 'Food pairing'))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.recommendedProductList.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return RecommendedFoodPage(productRecommended: widget.recommendedProductList[index],);
                      }));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: NetworkImage(ProductApi.base_url+'/uploads/'+widget.recommendedProductList[index].img!),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 100,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppLargeText(text: widget.recommendedProductList[index].name!),
                                    const SizedBox(
                                      height: 7,
                                    ),
                                    AppSmallText(text: 'With Vietnamese characteristics'),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        AppIconText(
                                          text: 'Normal',
                                          iconData: Icons.circle,
                                          colorIcon: AppColors.iconColor1,
                                          colorText: AppColors.mainColor,
                                        ),
                                        AppIconText(
                                          text: '1.7 km',
                                          iconData: Icons.location_on,
                                          colorIcon: AppColors.mainColor,
                                          colorText: AppColors.mainColor,
                                        ),
                                        AppIconText(
                                          text: '32 min',
                                          iconData: Icons.alarm_rounded,
                                          colorIcon: AppColors.iconColor2,
                                          colorText: AppColors.mainColor,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
