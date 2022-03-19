import 'package:flutter/material.dart';
import 'package:food/data/database.dart';
import 'package:food/main.dart';
import 'package:food/models/users_model.dart';
import 'package:food/utils/app_colors.dart';
import 'package:food/utils/share_preferences.dart';
import 'package:food/views/sign_up_part.dart';
import 'package:food/widgets/app_custom_button.dart';
import 'package:food/widgets/app_custom_text_field.dart';
import 'package:food/widgets/app_large_text.dart';
import 'package:food/widgets/app_small_text.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              margin: const EdgeInsets.only(bottom: 30),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/image/logo part 1.png'),
              )),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppLargeText(
                      text: 'Hello',
                      fontWeight: FontWeight.bold,
                      size: 60,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    AppSmallText(
                      text: 'Sign into your account',
                      color: Colors.grey,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            AppCustomTextField(
              textEditingController: phoneController,
              hintText: 'Phone',
              iconData: Icons.phone_android,
            ),
            AppCustomTextField(
              textEditingController: passwordController,
              hintText: 'Password',
              password: true,
              iconData: Icons.password,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 25),
              child: Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppSmallText(
                      text: 'Sign into your account',
                      color: Colors.grey,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            GestureDetector(
              onTap: () async {
                String phone = phoneController.text.toString();
                String password = passwordController.text.toString();
                Users user = await DatabaseUser().login(phone, password);
                bool check = user.name!=''?true:false;

                late BuildContext dialogContext;
                Widget cancelBtn = TextButton(
                  child: const Center(child: Text("Try again")),
                  onPressed: () {
                    Navigator.pop(dialogContext);
                  },
                );
                AlertDialog alert = AlertDialog(
                  title: Container(height: 50,width: double.maxFinite,child: const Text('Sign Up'),color: AppColors.mainColor,alignment: Alignment.center,),
                  content: const Text('Login failed!'),
                  actions: [cancelBtn],
                );
                if(!check){
                  showDialog(context: context, builder: (context){
                    dialogContext = context;
                    return alert;
                  });
                } else {
                  await SharePreference().save(user);
                  Navigator.push(context,MaterialPageRoute(builder: (context) => const MyApp()));
                }
              },
              child: AppCustomButton(
                text: 'Sign in',
                width: 170,
                radius: 28,
                sizeText: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppSmallText(
                  text: "Don't have an account? ",
                  size: 18,
                  color: Colors.grey,
                ),
                GestureDetector(
                  onTap: ()=>Navigator.push(context,MaterialPageRoute(builder: (context) => const SignUpPage())),
                  child: AppLargeText(
                    text: 'Create',
                    size: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
