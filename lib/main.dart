import 'package:flutter/material.dart';
import 'package:food/controller/popular_product_controller.dart';
import 'package:food/controller/recommended_product_controller.dart';
import 'package:food/data/database.dart';
import 'package:food/models/products.dart';
import 'package:food/utils/app_colors.dart';
import 'package:food/utils/share_preferences.dart';
import 'package:food/views/account_page.dart';
import 'package:food/views/cart_page.dart';
import 'package:food/views/home_page.dart';
import 'package:food/views/sign_in_page.dart';

import 'models/users_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseUser().init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  bool _isLoaded = false;
  String? phone = '';
  late Users users;
  late List<ProductsModel> popularProductsList;
  late List<ProductsModel> recommendedProductList;

  @override
  initState() {
    // TODO: implement initState
    super.initState();

    getToken();
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: !_isLoaded
          ? _loading()
          : (phone != null && phone != ''
              ? Scaffold(
                  body: _getBody(),
                  bottomNavigationBar: BottomNavigationBar(
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    selectedItemColor: AppColors.mainColor,
                    type: BottomNavigationBarType.fixed,
                    unselectedItemColor: AppColors.yellowColor,
                    currentIndex: _currentIndex,
                    onTap: (index) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home,
                        ),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_bag),
                        label: 'Shop',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_cart),
                        label: 'Cart',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Account',
                      ),
                    ],
                  ),
                )
              : const SignInPage()),
    );
  }

  getToken() async {
    var _phone = await SharePreference().getPhone();
    bool check = false;
    if(_phone!=''&&_phone!=null) check = true;
    Users u = Users();
    if(check) {
      u = await SharePreference().load();
    }
    setState(() {
      phone = _phone;
      users = u;
    });
  }

  getProduct() async {
    // get popular product list
    PopularProductController popularProductController =
        PopularProductController();
    await popularProductController.getPopularProductList();

    popularProductsList = popularProductController.popularProductList;

    // get recommended product list
    RecommendProductController recommendProductController =
        RecommendProductController();
    await recommendProductController.getRecommendProductList();
    recommendedProductList = recommendProductController.recommendedProductList;

    setState(() {
      _isLoaded = true;
    });
  }

  IndexedStack _getBody() {
    List<Widget> pages = [
      HomePage(
        popularProductList: popularProductsList,
        recommendedProductList: recommendedProductList,
      ),
      const CartPage(),
      const CartPage(),
      AccountPage(user: users),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }

  Widget _loading() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.mainColor,
        ),
      ),
    );
  }
}
