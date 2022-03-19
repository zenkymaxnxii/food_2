import 'package:flutter/material.dart';
import 'package:food/data/database.dart';
import 'package:food/models/users_model.dart';
import 'package:food/utils/app_colors.dart';
import 'package:food/views/sign_in_page.dart';
import 'package:food/widgets/app_custom_button.dart';
import 'package:food/widgets/app_custom_text_field.dart';
import 'package:food/widgets/app_large_text.dart';
import 'package:food/widgets/app_small_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController nameController = TextEditingController();

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
            AppCustomTextField(
              textEditingController: emailController,
              hintText: 'Email',
              iconData: Icons.email,
            ),
            AppCustomTextField(
              textEditingController: passwordController,
              hintText: 'Password',
              password: true,
              iconData: Icons.password,
            ),
            AppCustomTextField(
              textEditingController: phoneController,
              hintText: 'Phone',
              iconData: Icons.phone_android,
            ),
            AppCustomTextField(
              textEditingController: nameController,
              hintText: 'Name',
              iconData: Icons.person,
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () async {
                String name = nameController.text.toString();
                String email = emailController.text.toString();
                String phone = phoneController.text.toString();
                String password = passwordController.text.toString();
                int responseRS = await DatabaseUser()
                    .insertUsers(Users(0, name, email, phone, password));


                // check sign up
                late BuildContext diaLogContext;
                Widget loginBtn = TextButton(
                  child: const Center(child: Text("Sign In")),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInPage()));
                  },
                );
                Widget cancelBtn = TextButton(
                  child: const Center(child: Text("Try again")),
                  onPressed: () {
                    Navigator.of(diaLogContext).pop();
                  },
                );
                AlertDialog alert = AlertDialog(
                  title: Container(height: 50,width: double.maxFinite,child: const Text('Sign Up'),color: AppColors.mainColor,alignment: Alignment.center,),
                  content: responseRS > 0
                      ? const Text('Sign up successfully')
                      : const Text('Sign up failed, email or phone exist!'),
                  actions: [responseRS>0?loginBtn:cancelBtn],
                );
                showDialog(context: context, builder: (context){
                  diaLogContext = context;
                  return alert;
                });
              },
              child: AppCustomButton(
                text: 'Sign up',
                width: 170,
                radius: 28,
                sizeText: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInPage()));
              }
              ,child: AppLargeText(
                text: 'Have an account?',
                color: Colors.grey,
                size: 18,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            AppSmallText(
              text: 'Sign up using one of the flowing methods',
              size: 17,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/image/g.png',
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/image/t.png',
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/image/f.png',
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
