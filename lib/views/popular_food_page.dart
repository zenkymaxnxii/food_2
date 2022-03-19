import 'package:flutter/material.dart';
import 'package:food/data/product_api.dart';
import 'package:food/models/products.dart';
import 'package:food/utils/app_colors.dart';
import 'package:food/widgets/app_custom_button.dart';
import 'package:food/widgets/app_custom_icon.dart';
import 'package:food/widgets/app_large_text.dart';
import 'package:food/widgets/expanded_text.dart';

class PopularFoodPage extends StatefulWidget {
  PopularFoodPage({Key? key,required this.popularProduct}) : super(key: key);
  ProductsModel popularProduct;
  @override
  State<PopularFoodPage> createState() => _PopularFoodPageState();
}

class _PopularFoodPageState extends State<PopularFoodPage> {
  int quality = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 70,
            expandedHeight: 350,
            backgroundColor: AppColors.yellowColor,
            pinned: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: AppCustomIcon(
                    iconData: Icons.clear,
                    padding: 0,
                  ),
                ),
                AppCustomIcon(
                  iconData: Icons.shopping_cart_outlined,
                  padding: 2,
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                width: double.maxFinite,
                child: Center(
                    child: AppLargeText(
                  text: widget.popularProduct.name!,
                  color: Colors.black,
                  size: 26,
                )),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(ProductApi.base_url+'/uploads/'+widget.popularProduct.img!, fit: BoxFit.cover, width: double.maxFinite,)
            ),
          ),
          SliverToBoxAdapter(
            child: Container(margin: const EdgeInsets.only(left: 20, right: 20),child: ExpandedText(text: widget.popularProduct.description!,color: Colors.black45,)),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 180,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: AppColors.mainColor,
                    ),
                    child: GestureDetector(
                      onTap: (){
                        if(quality>0) setQuality(false);
                      },
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  AppLargeText(
                    text: '\$${widget.popularProduct.price} X $quality',
                    size: 25,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: AppColors.mainColor,
                    ),
                    child: GestureDetector(
                      onTap: (){
                        setQuality(true);
                      },
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 8),
              height: 120,
              padding: const EdgeInsets.only(
                  top: 30, bottom: 30, left: 20, right: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                color: Color(0xFFf7f6f4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    ),
                  ),
                  AppCustomButton(
                    text: '\$'+(widget.popularProduct.price!*quality).toString()+' | Add to cart',
                    width: 200,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
  void setQuality(bool isArrow){
    setState(() {
      isArrow?quality++:quality--;
    });
  }
}
