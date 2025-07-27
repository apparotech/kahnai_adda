import 'package:flutter/material.dart';
import 'package:kahaniadda/common_components/custom_text.dart';
import 'package:kahaniadda/const/brand_colors.dart';
import 'package:kahaniadda/screens/home_screen/story_screen/story_screen.dart';
import 'package:kahaniadda/utils/navigation_functions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget storyView() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 2.h),
    child: SizedBox(
      height: 12.h, // Adjust height for the story row
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8, // Number of stories, including "Your Story"
        itemBuilder: (context, index) {
          if (index == 0) {
            return GestureDetector(
              onTap: () {
                pushToScreen(context, const StoryViewScreen());
              },
              child: const StoryItem(
                label: 'Your story',
                nwtworkPath: 'assets/images/yourstory.avif',
                isYourStory: true,
              ),
            );
          } else {
            return GestureDetector(
              onTap: () {
                pushToScreen(context, const StoryViewScreen());
              },
              child: const StoryItem(
                label: 'Suhail',
                nwtworkPath: 'assets/images/suhail.webp',
              ),
            );
          }
        },
      ),
    ),
  );
}

class StoryItem extends StatelessWidget {
  final String label;
  final String nwtworkPath;
  final bool isYourStory;

  const StoryItem({
    super.key,
    required this.label,
    required this.nwtworkPath,
    this.isYourStory = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.w),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor:
                    isYourStory ? Colors.purple : Colors.transparent,
                backgroundImage: AssetImage(
                  nwtworkPath,
                ),
              ),
              if (isYourStory)
                Container(
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                      color: primary, shape: BoxShape.circle),
                  child: const Center(
                    child: Icon(
                      Icons.add,
                      color: white,
                      size: 20,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 1.h),
          customText(
            text: label,
            textcolor: black,
            fontsize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
