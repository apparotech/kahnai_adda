import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kahaniadda/common_components/custom_text.dart';
import 'package:kahaniadda/const/brand_colors.dart';
import 'package:kahaniadda/main.dart';
import 'package:kahaniadda/screens/add_post_screen/add_post_screen.dart';
import 'package:kahaniadda/utils/navigation_functions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PostsTabView extends ConsumerWidget {
  const PostsTabView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 1.h),
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 20.sp),
              child: Column(
                children: [
                  if (index == 0)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.sp),
                      child: SizedBox(
                        width: 184,
                        child: ElevatedButton(
                            onPressed: () {
                              pushToScreen(context, const CreatePostScreen());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.upload, color: white),
                                SizedBox(width: 10.sp),
                                const Text(
                                  'Upload Post',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            )),
                      ),
                    ),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 28,
                        backgroundColor: grey,
                        backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1601412436009-d964bd02edbc?q=80&w=1528&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                      ),
                      SizedBox(width: 15.sp),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customText(
                              text: 'Profile',
                              textcolor: primary,
                              fontsize: 16,
                              fontWeight: FontWeight.bold),
                          customText(
                            text: '2 Hours ago',
                            textcolor: grey,
                            fontsize: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 14.sp),
                  customText(
                      text:
                          "Could you clarify what you're asking? Are you requesting a description of something in exactly 50 letters or a 50-word description? Let me know so I can assist you better!",
                      textcolor: primary,
                      fontsize: 13,
                      fontWeight: FontWeight.bold),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: 230,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                          fit: BoxFit.cover,
                          'https://images.unsplash.com/photo-1729194292696-f22f22cfaeae?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
