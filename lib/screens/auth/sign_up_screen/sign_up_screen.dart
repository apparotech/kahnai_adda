import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kahaniadda/common_components/custom_button.dart';
import 'package:kahaniadda/common_components/custom_text.dart';
import 'package:kahaniadda/const/brand_colors.dart';
import 'package:kahaniadda/screens/bottom_nav_bar_widget/bottom_nav_bar_widget.dart';
import 'package:kahaniadda/screens/welcome_screen/login_with_container.dart';
import 'package:kahaniadda/utils/navigation_functions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SignUpScreen extends ConsumerWidget {
  SignUpScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10.h, bottom: 1.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(height: 6.h),
              RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(children: [
                    TextSpan(
                      text: 'Welcome back!\n',
                      style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 24),
                    ),
                    TextSpan(
                      text: 'Sign up to continue!',
                      style: TextStyle(
                          color: primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ])),
              SizedBox(height: 4.h),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: CustomButton(
                    borderRadius: BorderRadius.circular(15),
                    text: 'Continue with Google',
                    textColor: white,
                    onPressed: () {},
                    fontSize: 18.sp),
              ),
              SizedBox(height: 3.h),
              customText(
                  text: 'or',
                  textcolor: black,
                  fontsize: 14,
                  fontWeight: FontWeight.bold),
              SizedBox(height: 3.h),

              customTextField(hintText: 'Name', controller: nameController),
              SizedBox(height: 2.h),
              customTextField(hintText: 'Email', controller: emailController),
              SizedBox(height: 2.h),

              customTextField(
                obscuretext: true,
                hintText: 'Password',
                controller: passwordController,
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.visibility_off_outlined,
                      color: white,
                    )),
              ),
              SizedBox(height: 3.h),
              customText(
                  text:
                      'By signing up you are agreed with our\nfriendly terms and condition',
                  textcolor: black,
                  fontsize: 17.sp,
                  alignment: TextAlign.center),
              SizedBox(height: 3.h),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: CustomButton(
                    borderRadius: BorderRadius.circular(15),
                    text: 'Sign Up',
                    textColor: white,
                    onPressed: () {
                      pushToScreen(context, const BottomNavBarWidget());
                    },
                    fontSize: 18.sp),
              )
            ],
          ),
        ),
      ),
    );
  }
}
