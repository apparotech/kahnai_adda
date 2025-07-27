// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:kahaniadda/const/categories_list_image.dart';
// import 'package:kahaniadda/const/romance_image_list_home.dart';
// import 'package:kahaniadda/screens/home_screen/story_view.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'package:kahaniadda/common_components/custom_text.dart';
// import 'package:kahaniadda/const/brand_colors.dart';
// import 'package:velocity_x/velocity_x.dart';

// // Create a StateProvider to manage the current index
// final currentIndexProvider = StateProvider<int>((ref) => 0);

// class ForYouTabView extends ConsumerWidget {
//   const ForYouTabView({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // Watch the current index state
//     final currentIndex = ref.watch(currentIndexProvider);
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Story Section
//           storyView(),
//           // Placeholder for Scrollable Content (Like banners)

//           // VxSwiper for image sliding
//           VxSwiper.builder(
//             itemCount: 3,
//             itemBuilder: (context, index) {
//               return ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: Image.asset(
//                   'assets/images/slider.webp',
//                   fit: BoxFit.cover,
//                 ),
//               );
//             },
//             viewportFraction: 1.0,
//             aspectRatio: 18 / 11,
//             onPageChanged: (index) {
//               // Update the current index using Riverpod
//               ref.read(currentIndexProvider.notifier).state = index;
//             },
//           ),

//           // Indicator Dots for the above PageView
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 16.0),
//             child: Center(
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: List.generate(3, (index) {
//                   return Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 3),
//                     width: currentIndex == index
//                         ? 12
//                         : 8, // Dynamic width for active dot
//                     height: 8,
//                     decoration: BoxDecoration(
//                       color: currentIndex == index
//                           ? Colors.purple
//                           : Colors.grey, // Active indicator
//                       shape: BoxShape.circle,
//                     ),
//                   );
//                 }),
//               ),
//             ),
//           ),

//           SizedBox(
//             height: 2.h,
//           ),

//           // Latest Release Section
//           Container(
//             decoration: BoxDecoration(
//               color: primary.withOpacity(.3),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
//               child: customText(
//                 text: 'Latest Release',
//                 textcolor: primary,
//                 fontsize: 16.sp,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 2.h,
//           ),
//           VxSwiper.builder(
//             itemCount: 2, // Assuming you have 4 images to swipe through
//             itemBuilder: (context, index) {
//               return Image.asset(
//                 'assets/images/suhail.webp',
//                 fit: BoxFit.cover, // Ensures the image covers the entire area
//               );
//             },
//             viewportFraction: 0.6, // Increase the fraction for larger views
//             aspectRatio:
//                 2 / 1.5, // Adjust aspect ratio for a more portrait layout

//             onPageChanged: (index) {
//               // Update the current index using Riverpod
//               ref.read(currentIndexProvider.notifier).state = index;
//             },
//           ),

//           // Indicator Dots for the above PageView
//           Padding(
//             padding: EdgeInsets.symmetric(vertical: 16.0),
//             child: Center(
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: List.generate(3, (index) {
//                   return Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 3),
//                     width: currentIndex == index
//                         ? 12
//                         : 8, // Dynamic width for active dot
//                     height: 8,
//                     decoration: BoxDecoration(
//                       color: currentIndex == index
//                           ? Colors.purple
//                           : Colors.grey, // Active indicator
//                       shape: BoxShape.circle,
//                     ),
//                   );
//                 }),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 2.h,
//           ),
//           // Latest Release Section
//           Container(
//             decoration: BoxDecoration(
//               color: primary.withOpacity(.3),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
//               child: customText(
//                 text: 'Romance',
//                 textcolor: primary,
//                 fontsize: 16.sp,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 1.h,
//           ),

//           // Latest Release Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               customText(
//                   text: 'More',
//                   textcolor: black,
//                   fontsize: 13,
//                   fontWeight: FontWeight.bold),
//               const Icon(
//                 Icons.arrow_right_outlined,
//                 color: black,
//               )
//             ],
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 2.w),
//             child: GridView.builder(
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: 2,
//                 shrinkWrap: true,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 4,
//                     mainAxisSpacing: 4,
//                     mainAxisExtent: 270),
//                 itemBuilder: (context, index) {
//                   final item = romanceSection[index];
//                   return Column(
//                     children: [
//                       SizedBox(
//                         height: 200,
//                         width: double.infinity,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: Image.asset(
//                             item['image']!,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 1.h,
//                       ),
//                       Text(
//                         item['name']!, // Title text
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.purple,
//                         ),
//                       ),
//                       const SizedBox(height: 4.0),
//                       Text(
//                         item['duration']!, // Subtitle text
//                         style: const TextStyle(
//                           fontSize: 14,
//                           color: Colors.purple,
//                         ),
//                       ),
//                       Text(
//                         item['reads']!, // Additional information
//                         style: const TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   );
//                 }),
//           ),

//           SizedBox(
//             height: 2.h,
//           ),
//           Container(
//             decoration: BoxDecoration(
//               color: primary.withOpacity(.3),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
//               child: customText(
//                 text: 'Drama',
//                 textcolor: primary,
//                 fontsize: 16.sp,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 1.h,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               customText(
//                   text: 'More',
//                   textcolor: black,
//                   fontsize: 13,
//                   fontWeight: FontWeight.bold),
//               const Icon(
//                 Icons.arrow_right_outlined,
//                 color: black,
//               )
//             ],
//           ),

//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 2.w),
//             child: GridView.builder(
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: 2,
//                 shrinkWrap: true,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 4,
//                     mainAxisSpacing: 4,
//                     mainAxisExtent: 270),
//                 itemBuilder: (context, index) {
//                   final item = dramaSection[index];
//                   return Column(
//                     children: [
//                       SizedBox(
//                         height: 200,
//                         width: double.infinity,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: Image.asset(
//                             item['image']!,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 1.h,
//                       ),
//                       Text(
//                         item['name']!, // Title text
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.purple,
//                         ),
//                       ),
//                       const SizedBox(height: 4.0),
//                       Text(
//                         item['duration']!, // Subtitle text
//                         style: const TextStyle(
//                           fontSize: 14,
//                           color: Colors.purple,
//                         ),
//                       ),
//                       Text(
//                         item['reads']!, // Additional information
//                         style: const TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   );
//                 }),
//           ),

//           SizedBox(
//             height: 2.h,
//           ),

//           Container(
//             decoration: BoxDecoration(
//               color: primary.withOpacity(.3),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Padding(
//               padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
//               child: customText(
//                 text: 'Horror Story',
//                 textcolor: primary,
//                 fontsize: 16.sp,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 1.h,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               customText(
//                   text: 'More',
//                   textcolor: black,
//                   fontsize: 13,
//                   fontWeight: FontWeight.bold),
//               const Icon(
//                 Icons.arrow_right_outlined,
//                 color: black,
//               )
//             ],
//           ),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 2.w),
//             child: GridView.builder(
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: 2,
//                 shrinkWrap: true,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 4,
//                     mainAxisSpacing: 4,
//                     mainAxisExtent: 270),
//                 itemBuilder: (context, index) {
//                   final item = horrorSection[index];
//                   return Column(
//                     children: [
//                       SizedBox(
//                         height: 200,
//                         width: double.infinity,
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: Image.asset(
//                             item['image']!,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 1.h,
//                       ),
//                       Text(
//                         item['name']!, // Title text
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.purple,
//                         ),
//                       ),
//                       const SizedBox(height: 4.0),
//                       Text(
//                         item['duration']!, // Subtitle text
//                         style: const TextStyle(
//                           fontSize: 14,
//                           color: Colors.purple,
//                         ),
//                       ),
//                       Text(
//                         item['reads']!, // Additional information
//                         style: const TextStyle(
//                           fontSize: 12,
//                           color: Colors.grey,
//                         ),
//                       ),
//                     ],
//                   );
//                 }),
//           ),
//           SizedBox(height: 1.h),
//           // Add more sections if needed
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kahaniadda/common_components/custom_text.dart';
import 'package:kahaniadda/const/brand_colors.dart';
import 'package:kahaniadda/const/romance_image_list_home.dart';
import 'package:kahaniadda/screens/home_screen/home_category_details.dart/home_category_details.dart';
import 'package:kahaniadda/screens/home_screen/story_view.dart';
import 'package:kahaniadda/screens/text_book_view_screen/text_book_view_screen.dart';
import 'package:kahaniadda/utils/navigation_functions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:velocity_x/velocity_x.dart';

// Create a StateProvider to manage the current index
final currentIndexProvider = StateProvider<int>((ref) => 0);

class ForYouTabViews extends ConsumerWidget {
  const ForYouTabViews({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(currentIndexProvider);
    return Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Story Section
              storyView(),

              // VxSwiper for image sliding
              VxSwiper.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/slider.webp',
                      fit: BoxFit.cover,
                    ),
                  );
                },
                viewportFraction: 1.0,
                aspectRatio: 18 / 11,
                onPageChanged: (index) {
                  // Update the current index using Riverpod
                  ref.read(currentIndexProvider.notifier).state = index;
                },
              ),

              // Indicator Dots for the above PageView
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(3, (index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        width: currentIndex == index
                            ? 12
                            : 8, // Dynamic width for active dot
                        height: 8,
                        decoration: BoxDecoration(
                          color: currentIndex == index
                              ? Colors.purple
                              : Colors.grey, // Active indicator
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                decoration: BoxDecoration(
                  color: primary.withOpacity(.3),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                  child: customText(
                    text: 'Latest Release',
                    textcolor: primary,
                    fontsize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: SizedBox(
                  height: 250, // Adjust the height for each row
                  child: GridView.builder(
                    shrinkWrap: true,
                    scrollDirection:
                        Axis.horizontal, // Each row scrolls horizontally
                    itemCount: dramaSection.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, // Only one item per row vertically
                      mainAxisExtent: 180, // Width of each item
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          SizedBox(
                            height: 200,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/suhail.webp',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: primary.withOpacity(.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 1.h),
                        child: customText(
                          text: 'Romance',
                          textcolor: primary,
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
                    SizedBox(
                      height: 290, // Adjust the height for each row
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
                                  onTap: () {
                                    pushToScreen(
                                        context, const TextBookViewScreen());
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      item['image']!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                item['name']!, // Title text
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                item['duration']!, // Subtitle text
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.purple,
                                ),
                              ),
                              Text(
                                item['reads']!, // Additional information
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    // drama story section
                    Container(
                      decoration: BoxDecoration(
                        color: primary.withOpacity(.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 1.h),
                        child: customText(
                          text: 'Drama',
                          textcolor: primary,
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
                    SizedBox(
                      height: 290, // Adjust the height for each row
                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection:
                            Axis.horizontal, // Each row scrolls horizontally
                        itemCount: dramaSection.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1, // Only one item per row vertically
                          mainAxisExtent: 180, // Width of each item
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                        ),
                        itemBuilder: (context, index) {
                          final item = dramaSection[index];
                          return Column(
                            children: [
                              SizedBox(
                                height: 200,
                                width: double.infinity,
                                child: GestureDetector(
                                  onTap: () {
                                    pushToScreen(
                                        context, const TextBookViewScreen());
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      item['image']!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                item['name']!, // Title text
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                item['duration']!, // Subtitle text
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.purple,
                                ),
                              ),
                              Text(
                                item['reads']!, // Additional information
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    // horror story section
                    Container(
                      decoration: BoxDecoration(
                        color: primary.withOpacity(.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 4.w, vertical: 1.h),
                        child: customText(
                          text: 'Horror',
                          textcolor: primary,
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
                    SizedBox(
                      height: 290, // Adjust the height for each row
                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection:
                            Axis.horizontal, // Each row scrolls horizontally
                        itemCount: horrorSection.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1, // Only one item per row vertically
                          mainAxisExtent: 180, // Width of each item
                          crossAxisSpacing: 4,
                          mainAxisSpacing: 4,
                        ),
                        itemBuilder: (context, index) {
                          final item = horrorSection[index];
                          return Column(
                            children: [
                              SizedBox(
                                height: 200,
                                width: double.infinity,
                                child: GestureDetector(
                                  onTap: () {
                                    pushToScreen(
                                        context, const TextBookViewScreen());
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      item['image']!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                item['name']!, // Title text
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.purple,
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Text(
                                item['duration']!, // Subtitle text
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.purple,
                                ),
                              ),
                              Text(
                                item['reads']!, // Additional information
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
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
        ));
  }
}
