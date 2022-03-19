import 'package:flutter/material.dart';
import 'package:food/models/users_model.dart';
import 'package:food/utils/app_colors.dart';
import 'package:food/utils/share_preferences.dart';
import 'package:food/views/sign_in_page.dart';
import 'package:food/widgets/app_custom_icon.dart';
import 'package:food/widgets/app_large_text.dart';

class AccountPage extends StatelessWidget {
  AccountPage({Key? key,required this.user}) : super(key: key);
  Users user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 45,),
            Center(
              child: AppCustomIcon(
                iconData: Icons.person,
                colorIcon: Colors.white,
                backgroundColor: AppColors.mainColor,
                height: 140,
                width: 140,
                radius: 100,
                iconSize: 50,
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              margin: const EdgeInsets.only(top: 13,bottom: 13),
              height: 70,
              padding: const EdgeInsets.only(left: 20, right: 20),
              color: Colors.white,
              child: Row(
                children: [
                  AppCustomIcon(
                    iconData: Icons.person,
                    colorIcon: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    height: 50,
                    width: 50,
                    radius: 100,
                    iconSize: 25,
                  ),
                  const SizedBox(width: 20,),
                  AppLargeText(text: user.name),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 13,bottom: 13),
              height: 70,
              padding: const EdgeInsets.only(left: 20, right: 20),
              color: Colors.white,
              child: Row(
                children: [
                  AppCustomIcon(
                    iconData: Icons.call,
                    colorIcon: Colors.white,
                    backgroundColor: const Color(0xFFffd37a),
                    height: 50,
                    width: 50,
                    radius: 100,
                    iconSize: 25,
                  ),
                  const SizedBox(width: 20,),
                  AppLargeText(text: user.phone),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 13,bottom: 13),
              height: 70,
              padding: const EdgeInsets.only(left: 20, right: 20),
              color: Colors.white,
              child: Row(
                children: [
                  AppCustomIcon(
                    iconData: Icons.email,
                    colorIcon: Colors.white,
                    backgroundColor: const Color(0xFFffd37a),
                    height: 50,
                    width: 50,
                    radius: 100,
                    iconSize: 25,
                  ),
                  const SizedBox(width: 20,),
                  AppLargeText(text: user.email),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 13,bottom: 13),
              height: 70,
              padding: const EdgeInsets.only(left: 20, right: 20),
              color: Colors.white,
              child: Row(
                children: [
                  AppCustomIcon(
                    iconData: Icons.location_on,
                    colorIcon: Colors.white,
                    backgroundColor: const Color(0xFFffd37a),
                    height: 50,
                    width: 50,
                    radius: 100,
                    iconSize: 25,
                  ),
                  const SizedBox(width: 20,),
                  AppLargeText(text: 'Fill in the address'),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 13,bottom: 13),
              height: 70,
              padding: const EdgeInsets.only(left: 20, right: 20),
              color: Colors.white,
              child: Row(
                children: [
                  AppCustomIcon(
                    iconData: Icons.message,
                    colorIcon: Colors.white,
                    backgroundColor: const Color(0xFFfb5252),
                    height: 50,
                    width: 50,
                    radius: 100,
                    iconSize: 25,
                  ),
                  const SizedBox(width: 20,),
                  AppLargeText(text: 'None'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                await SharePreference().logout();
                Navigator.push(context,MaterialPageRoute(builder: (context) => const SignInPage()));
              },
              child: Container(
                margin: const EdgeInsets.only(top: 13,bottom: 13),
                height: 70,
                padding: const EdgeInsets.only(left: 20, right: 20),
                color: Colors.white,
                child: Row(
                  children: [
                    AppCustomIcon(
                      iconData: Icons.logout,
                      colorIcon: Colors.white,
                      backgroundColor: const Color(0xFFfb5252),
                      height: 50,
                      width: 50,
                      radius: 100,
                      iconSize: 25,
                    ),
                    const SizedBox(width: 20,),
                    AppLargeText(text: 'Log out'),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
