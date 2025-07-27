import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kahaniadda/common_components/custom_button.dart';
import 'package:kahaniadda/common_components/custom_text.dart';
import 'package:kahaniadda/const/brand_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final selectedPlanProvider = StateProvider<String?>((ref) => null);

class PrimeTabView extends ConsumerWidget {
  const PrimeTabView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguage = ref.watch(selectedPlanProvider);
    final List<Map<String, String>> options = [
      {
        'title': 'Annual',
        'subtitle': 'First 30 days free - Then ₹999/Year',
        'buttontext': 'Best Value',
      },
      {
        'title': 'Monthly',
        'subtitle': 'First 7 days free - Then ₹99/Month',
        'buttontext': '',
      },
      {
        'title': '3 Month',
        'subtitle': 'First 7 days free - Then ₹99/Month',
        'buttontext': '',
      },
      {
        'title': '6 Month',
        'subtitle': 'First 7 days free - Then ₹99/Month',
        'buttontext': '',
      },
    ];
    return Padding(
      padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 4.h),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Column(
                children: [
                  customText(
                      text: 'Get Prime',
                      textcolor: primary,
                      fontsize: 20.sp,
                      fontWeight: FontWeight.bold),
                  SizedBox(height: 10.sp),
                  customText(
                      alignment: TextAlign.center,
                      text:
                          'Unlock all the power of this mobile tool and enjoy digital experience like never before!',
                      textcolor: primary,
                      fontsize: 14.sp,
                      fontWeight: FontWeight.normal),
                ],
              ),
            ),
            SizedBox(height: 10.sp),
            Image.asset(
              'assets/icons/ranking.png',
              height: 120, // Set image height
            ),
            SizedBox(height: 10.sp),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: options.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final isSelected = options[index]['title'] == selectedLanguage;

                return Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: GestureDetector(
                    onTap: () {
                      ref.read(selectedPlanProvider.notifier).state =
                          options[index]['title'];
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: primary.withOpacity(.2),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: isSelected ? primary : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: ListTile(
                          subtitle: customText(
                              text: options[index]['subtitle']!,
                              textcolor: black,
                              fontsize: 15,
                              lineheight: 7.sp),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              customText(
                                text: options[index]['title']!,
                                textcolor: black,
                                fontsize: 15,
                              ),
                              index == 0
                                  ? Container(
                                      height: 30,
                                      width: 82,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: black),
                                      child: Center(
                                        child: customText(
                                          text: 'Best Value',
                                          textcolor: white,
                                          fontsize: 13.sp,
                                        ),
                                      ),
                                    )
                                  : const SizedBox()
                            ],
                          )),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 18.sp),
            SizedBox(
              height: 45,
              width: double.infinity,
              child: CustomButton(
                  borderRadius: BorderRadius.circular(15),
                  text: 'Start 30-day free trial',
                  textColor: white,
                  onPressed: () {},
                  fontSize: 15.sp),
            ),
            SizedBox(height: 15.sp),
            customText(
                alignment: TextAlign.center,
                text:
                    'By placing this order, you agree to the Terms of Service and Privacy Policy. Subscription automatically renews unless auto-renew is turned off at least 24-hours before the end of the current period.',
                textcolor: primary,
                fontsize: 14.sp,
                fontWeight: FontWeight.normal),
          ],
        ),
      ),
    );
  }
}
