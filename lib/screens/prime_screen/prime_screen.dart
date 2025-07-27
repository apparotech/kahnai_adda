import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kahaniadda/common_components/custom_button.dart';
import 'package:kahaniadda/common_components/custom_text.dart';
import 'package:kahaniadda/const/brand_colors.dart';
import 'package:kahaniadda/const/categories_list_image.dart';
import 'package:kahaniadda/const/romance_image_list_home.dart';
import 'package:kahaniadda/main.dart';
import 'package:kahaniadda/screens/home_screen/categories_tab_view.dart';
import 'package:kahaniadda/screens/prime_screen/subscription_screen/subscription_screen.dart';
import 'package:kahaniadda/utils/navigation_functions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PrimeScreen extends ConsumerWidget {
  const PrimeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primeAppBarColor,
        leading: SizedBox(
          height: 24, // Adjust size if needed
          width: 24,
          child: SvgPicture.asset('assets/icons/prime.svg'),
        ),
        title: customText(
          text: 'Kahani Addaaa Prime',
          textcolor: yellow,
          fontsize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
              height: 80,
              decoration: BoxDecoration(
                color: primeAppBarColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customText(
                    text: 'Only ₹89',
                    textcolor: yellow,
                    fontsize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 45,
                    child: CustomButton(
                      background: yellow,
                      borderRadius: BorderRadius.circular(5),
                      text: 'Go Prime',
                      textColor: black,
                      onPressed: () {
                        pushToScreen(context, const SubscriptionScreen());
                      },
                      fontSize: 18.sp,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 1.h),
            Container(
              decoration: BoxDecoration(
                color: blue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
                child: customText(
                  text: 'For You',
                  textcolor: white,
                  fontsize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                customText(
                    text: 'More',
                    textcolor: black,
                    fontsize: 13,
                    fontWeight: FontWeight.bold),
                const Icon(
                  Icons.arrow_right_outlined,
                  color: black,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.sp),
              child: Column(
                children: [
                  SizedBox(
                    height: 230, // Adjust the height for each row
                    child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection:
                          Axis.horizontal, // Each row scrolls horizontally
                      itemCount: romanceSection.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, // Only one item per row vertically
                        mainAxisExtent: 180, // Width of each item
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                      ),
                      itemBuilder: (context, index) {
                        final item = romanceSection[index];
                        return Column(
                          children: [
                            SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: GestureDetector(
                                onTap: () {},
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    item['image']!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
                      child: customText(
                        text: 'For You',
                        textcolor: white,
                        fontsize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.sp),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      customText(
                          text: 'More',
                          textcolor: black,
                          fontsize: 13,
                          fontWeight: FontWeight.bold),
                      const Icon(
                        Icons.arrow_right_outlined,
                        color: black,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 230, // Adjust the height for each row
                    child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection:
                          Axis.horizontal, // Each row scrolls horizontally
                      itemCount: romanceSection.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, // Only one item per row vertically
                        mainAxisExtent: 180, // Width of each item
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                      ),
                      itemBuilder: (context, index) {
                        final item = romanceSection[index];
                        return Column(
                          children: [
                            SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: GestureDetector(
                                onTap: () {},
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    item['image']!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10.w, vertical: 1.h),
                      child: customText(
                        text: 'For You',
                        textcolor: white,
                        fontsize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      customText(
                          text: 'More',
                          textcolor: black,
                          fontsize: 13,
                          fontWeight: FontWeight.bold),
                      const Icon(
                        Icons.arrow_right_outlined,
                        color: black,
                      )
                    ],
                  ),
                  SizedBox(height: 10.sp),
                  SizedBox(
                    height: 230, // Adjust the height for each row
                    child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection:
                          Axis.horizontal, // Each row scrolls horizontally
                      itemCount: romanceSection.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, // Only one item per row vertically
                        mainAxisExtent: 180, // Width of each item
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                      ),
                      itemBuilder: (context, index) {
                        final item = romanceSection[index];
                        return Column(
                          children: [
                            SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: GestureDetector(
                                onTap: () {},
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    item['image']!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
