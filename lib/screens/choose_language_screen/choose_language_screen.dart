import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kahaniadda/common_components/custom_button.dart';
import 'package:kahaniadda/common_components/custom_text.dart';
import 'package:kahaniadda/const/brand_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

final selectedLanguageProvider = StateProvider<String?>((ref) => null);

class ChooseLanguageScreen extends ConsumerWidget {
  const ChooseLanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedLanguage = ref.watch(selectedLanguageProvider);
    final List<Map<String, String>> options = [
      {
        'language': 'English',
        'icon': 'assets/icons/eg.png',
      },
      {
        'language': 'Hindi',
        'icon': 'assets/icons/india.png',
      },
    ];

    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        automaticallyImplyLeading: true,
        title: customText(
          text: 'Choose language',
          textcolor: black,
          fontsize: 15,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/icons/chat.png'),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: BoxDecoration(
                    color: primary.withOpacity(.2),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: customText(
                    text: 'Choose Language',
                    textcolor: primary,
                    fontsize: 15,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            ListView.builder(
              itemCount: options.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final isSelected =
                    options[index]['language'] == selectedLanguage;

                return Padding(
                  padding: EdgeInsets.only(top: 1.h),
                  child: GestureDetector(
                    onTap: () {
                      ref.read(selectedLanguageProvider.notifier).state =
                          options[index]['language'];
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: primary.withOpacity(.2),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: isSelected ? Colors.red : Colors.transparent,
                          width: 2,
                        ),
                      ),
                      child: ListTile(
                        leading: Image.asset(options[index]['icon']!),
                        title: customText(
                          text: options[index]['language']!,
                          textcolor: black,
                          fontsize: 15,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 3.h,
            ),
            SizedBox(
              height: 44,
              width: double.infinity,
              child: CustomButton(
                  text: 'Continue',
                  textColor: white,
                  onPressed: () {},
                  fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}
