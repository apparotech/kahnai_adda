import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kahaniadda/common_components/custom_text.dart';
import 'package:kahaniadda/const/brand_colors.dart';
import 'package:kahaniadda/const/categories_list_image.dart';
import 'package:kahaniadda/screens/home_screen/home_category_details.dart/home_category_details.dart';
import 'package:kahaniadda/screens/home_screen/story_view.dart';
import 'package:kahaniadda/utils/navigation_functions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CategoriesTabView extends ConsumerWidget {
  final bool isStoryActive;
  const CategoriesTabView({
    super.key,
    required this.isStoryActive,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // story section
          isStoryActive ? storyView() : const SizedBox(),
          SizedBox(height: 1.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categoriesImages.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    mainAxisExtent: 270),
                itemBuilder: (context, index) {
                  final items = categoriesImages[index];
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          pushToScreen(context, RomanceStoriesScreen());
                        },
                        child: SizedBox(
                          height: 200,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              items['image']!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: primary.withOpacity(.3),
                        ),
                        child: Center(
                          child: customText(
                              text: items['name']!,
                              textcolor: primary,
                              fontsize: 15.sp),
                        ),
                      )
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
}
