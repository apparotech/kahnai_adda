import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kahaniadda/const/brand_colors.dart';
import 'package:kahaniadda/screens/prime_screen/profile_screen/profile_screen.dart';
import 'package:kahaniadda/utils/navigation_functions.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class TextBookViewScreen extends ConsumerWidget {
  const TextBookViewScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          GestureDetector(
            onTap: () {
              pushToScreen(context, const ProfileScreen());
            },
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: ClipOval(
                child: SvgPicture.asset(
                  'assets/icons/profile-placeholder.svg',
                  fit: BoxFit.cover, // Ensures the image fits the circle
                  width: 50, // Specify width
                  height: 50, // Specify height
                ),
              ),
            ),
          ),
          SizedBox(width: 3.w),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Book cover
              SizedBox(
                height: 200,
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThcjTy_SgHP_EnZw53sDkYvB3V67-qXdeyuA&s',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),

              // Track details
              const Text(
                'Introduction Part 1',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'By Robert Kiyosaki',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBar(
                    filledIcon: Icons.star,
                    emptyIcon: Icons.star_border,
                    onRatingChanged: (value) => debugPrint('$value'),
                    initialRating: 3,
                    size: 25,
                    maxRating: 5,
                  ),
                ],
              ),
              SizedBox(height: 16.sp),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 15.sp, vertical: 6.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: grey.withOpacity(.3)),
                child: const Text(
                  '12.1k Time Read',
                  style: TextStyle(color: black),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'The is story is dummy story The is story is dummy storyThe is story is dummy storyThe is story is dummy storyThe is story is dummy storyThe is story is dummy storyThe is story is dummy story',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16.sp, color: black),
              ),
              SizedBox(height: 14.sp),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.chat),
                    onPressed: () {
                      // Implement favorite functionality
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {
                      // Implement share functionality
                    },
                  ),
                ],
              ),
              // Track list
              Expanded(
                child: ListView(
                  children: [
                    _buildTrackItem('Introduction Part 1', '12 min'),
                    _buildTrackItem('Introduction Part 2', '24 min'),
                    _buildTrackItem('How Do I Start Getting Rich?', '34 min'),
                    _buildTrackItem('My Job Vs My Business', '15 min'),
                    _buildTrackItem('Money is Not Real', '45 min'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrackItem(String title, String duration) {
    return ListTile(
      leading: const Icon(Icons.play_circle_outline),
      title: Text(title),
      subtitle: Text(duration),
      trailing: const Icon(Icons.file_download),
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "${duration.inHours > 0 ? '${twoDigits(duration.inHours)}:' : ''}$minutes:$seconds";
  }
}
