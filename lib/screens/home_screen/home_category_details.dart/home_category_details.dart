import 'package:flutter/material.dart';
import 'package:kahaniadda/common_components/custom_text.dart';
import 'package:kahaniadda/const/brand_colors.dart';
import 'package:kahaniadda/screens/text_book_view_screen/text_book_view_screen.dart';
import 'package:kahaniadda/utils/navigation_functions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RomanceStoriesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> stories = [
    {
      'title': 'Romance',
      'subtitle': 'love is life',
      'reads': '2.3k times read',
      'parts': '20 parts',
      'image': 'assets/categories/yoga.webp',
    },
    {
      'title': 'Romance',
      'subtitle': 'love is life',
      'reads': '2.3k times read',
      'parts': '20 parts',
      'image': 'assets/categories/yoga.webp',
    },
    {
      'title': 'Romance',
      'subtitle': 'love is life',
      'reads': '2.3k times read',
      'parts': '20 parts',
      'image': 'assets/categories/yoga.webp',
    },
    {
      'title': 'Romance',
      'subtitle': 'love is life',
      'reads': '2.3k times read',
      'parts': '20 parts',
      'image': 'assets/categories/yoga.webp',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: customText(
          text: 'dummy title',
          textcolor: black,
          fontsize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView.builder(
        itemCount: stories.length,
        itemBuilder: (context, index) {
          final story = stories[index];
          return Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: InkWell(
              onTap: () {
                pushToScreen(context, const TextBookViewScreen());
              },
              child: Row(
                children: [
                  // Story Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      story['image'],
                      height: 180,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16.sp),
                  // Story Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              story['title'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.more_vert),
                              onPressed: () {
                                // Add options functionality here
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 6.sp),
                        Text(
                          story['subtitle'],
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 10.sp),
                        Text(
                          story['reads'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 20.sp),
                        Container(
                          width: 100,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.comment_outlined,
                                color: white,
                                size: 20,
                              ),
                              SizedBox(width: 10.sp),
                              Text(
                                story['parts'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // More Options Button
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
