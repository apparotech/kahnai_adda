import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kahaniadda/common_components/custom_button.dart';
import 'package:kahaniadda/common_components/custom_text.dart';
import 'package:kahaniadda/const/brand_colors.dart';
import 'package:kahaniadda/screens/auth/login_screen/login_screen.dart';
import 'package:kahaniadda/screens/auth/sign_up_screen/sign_up_screen.dart';
import 'package:kahaniadda/utils/navigation_functions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class WelcomeScreen extends ConsumerWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10.h),
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
                    text: 'Sign in to continue!',
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
            SizedBox(
              height: 50,
              width: double.infinity,
              child: CustomButton(
                  borderRadius: BorderRadius.circular(15),
                  text: 'Sign up with email',
                  textColor: white,
                  onPressed: () {
                    pushToScreen(context, SignUpScreen());
                  },
                  fontSize: 18.sp),
            ),
            SizedBox(height: 3.h),
            customText(
                text:
                    'By signing up you are agreed with our\nfriendly terms and condition',
                textcolor: black,
                fontsize: 17.sp,
                alignment: TextAlign.center),
            const Spacer(),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: CustomButton(
                  borderRadius: BorderRadius.circular(15),
                  text: 'Sign In',
                  textColor: white,
                  onPressed: () {
                    pushToScreen(context, LoginScreen());
                  },
                  fontSize: 18.sp),
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }
}
