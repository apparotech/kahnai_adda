import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kahaniadda/const/brand_colors.dart';
import 'package:kahaniadda/const/romance_image_list_home.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContentTabView extends ConsumerWidget {
  const ContentTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.sp),
          child: SizedBox(
            width: 220,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.upload, color: white),
                    SizedBox(width: 10.sp),
                    const Text(
                      'Upload Content',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 2.w),
          child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: horrorSection.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4,
                  mainAxisExtent: 270),
              itemBuilder: (context, index) {
                final items = horrorSection[index];
                return Column(
                  children: [
                    SizedBox(
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
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      items['name']!, // Title text
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      items['duration']!, // Subtitle text
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.purple,
                      ),
                    ),
                    Text(
                      items['reads']!, // Additional information
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                );
              }),
        ),
      ],
    );
  }
}
