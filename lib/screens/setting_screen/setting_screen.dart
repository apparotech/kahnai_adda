import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kahaniadda/common_components/custom_button.dart';
import 'package:kahaniadda/common_components/custom_text.dart';
import 'package:kahaniadda/const/brand_colors.dart';
import 'package:kahaniadda/screens/choose_language_screen/choose_language_screen.dart';
import 'package:kahaniadda/utils/navigation_functions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        centerTitle: true,
        title: customText(text: 'Setting', textcolor: black, fontsize: 16),
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              pushToScreen(context, const ChooseLanguageScreen());
            },
            leading: const Icon(
              Icons.language,
              color: primary,
            ),
            title: customText(
              text: 'Language',
              textcolor: primary,
              fontsize: 16,
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                customText(
                  text: 'English +1',
                  textcolor: primary,
                  fontsize: 16,
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: primary,
                ),
              ],
            ),
          ),
          SizedBox(height: 10.sp),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.refresh,
              color: primary,
            ),
            title: customText(
              text: 'Restore Purchase (Subscription)',
              textcolor: primary,
              fontsize: 16,
            ),
          ),
          SizedBox(height: 10.sp),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.call,
              color: primary,
            ),
            title: customText(
              text: 'Contact Us',
              textcolor: primary,
              fontsize: 16,
            ),
          ),
          SizedBox(height: 10.sp),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.file_copy_rounded,
              color: primary,
            ),
            title: customText(
              text: 'Terms and Conditions',
              textcolor: primary,
              fontsize: 16,
            ),
          ),
          SizedBox(height: 10.sp),
          ListTile(
            onTap: () {},
            leading: const Icon(
              Icons.privacy_tip,
              color: primary,
            ),
            title: customText(
              text: 'Privacy Policy',
              textcolor: primary,
              fontsize: 16,
            ),
          ),
          SizedBox(height: 10.sp),
          ListTile(
            onTap: () {}, // Define action for Facebook
            leading: const Icon(
              Icons.facebook,
              color: primary,
            ),
            title: customText(
              text: 'Facebook',
              textcolor: primary,
              fontsize: 16,
            ),
          ),
          SizedBox(height: 10.sp),
          ListTile(
            onTap: () {}, // Define action for Instagram
            leading: const Icon(
              Icons
                  .photo_camera, // Use camera icon or substitute with a custom Instagram icon
              color: primary,
            ),
            title: customText(
              text: 'Instagram',
              textcolor: primary,
              fontsize: 16,
            ),
          ),
          SizedBox(height: 10.sp),
          ListTile(
            onTap: () {}, // Define action for Twitter
            leading: const Icon(
              Icons
                  .alternate_email, // Use an alternate email icon or substitute with a Twitter icon
              color: primary,
            ),
            title: customText(
              text: 'Twitter',
              textcolor: primary,
              fontsize: 16,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.sp, vertical: 20.sp),
            child: SizedBox(
              height: 44,
              child: CustomButton(
                  borderRadius: BorderRadius.circular(10),
                  text: 'Logout',
                  textColor: white,
                  onPressed: () {},
                  fontSize: 14.sp),
            ),
          )
        ],
      ),
    );
  }
}
