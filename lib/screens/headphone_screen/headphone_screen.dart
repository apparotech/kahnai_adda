import 'package:flutter/material.dart';
import 'package:kahaniadda/common_components/custom_text.dart';
import 'package:kahaniadda/const/brand_colors.dart';
import 'package:kahaniadda/screens/audio_player_screen/audio_player_screen.dart';
import 'package:kahaniadda/utils/navigation_functions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HeadphoneScreen extends StatelessWidget {
  const HeadphoneScreen({super.key});

  Widget buildBookItem(String image, String title, context,
      {bool isLive = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            GestureDetector(
              onTap: () {
                pushToScreen(context, const AudioPlayerScreen());
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), // Adds rounded corners
                child: Image.network(
                  image,
                  height: 200,
                  width: 100.w / 2 - 24, // Adjust width for two items per line
                  fit: BoxFit.cover,
                ),
              ),
            ),
            if (isLive)
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Live',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(fontSize: 14.sp),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Widget buildSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.sp),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: primary.withOpacity(.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                child: customText(
                  text: title,
                  textcolor: primary,
                  fontsize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'More',
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: items
                .map((item) => Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: item,
                    ))
                .toList(),
          ),
        ),
        SizedBox(height: 16.sp),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: white,
        title: customText(
          text: 'Kahani Addaa FM',
          textcolor: black,
          fontsize: 18.sp,
        ),
      ),
      body: ListView(
        children: [
          buildSection('Popular Books', [
            buildBookItem(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRraMVXtap2wxC3bSk57d17ho0zRQEhRpgkEg&s',
                'Rich Dad',
                context),
            buildBookItem(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMUCCfI9-WvBW_urKk_v5UTIX1z2BssuXVuw&s',
                'Sunil Chhetri',
                context,
                isLive: true),
            buildBookItem(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMUCCfI9-WvBW_urKk_v5UTIX1z2BssuXVuw&s',
                'Periyar Amb',
                context),
            buildBookItem(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMUCCfI9-WvBW_urKk_v5UTIX1z2BssuXVuw&s',
                'Periyar Amb',
                context),
            buildBookItem(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMUCCfI9-WvBW_urKk_v5UTIX1z2BssuXVuw&s',
                'Periyar Amb',
                context),
          ]),
          buildSection('Recommended', [
            buildBookItem(
                'https://m.media-amazon.com/images/I/61jBLw5Bq9L._AC_UF1000,1000_QL80_.jpg',
                'Rich Dad And',
                context),
            buildBookItem(
                'https://m.media-amazon.com/images/I/61jBLw5Bq9L._AC_UF1000,1000_QL80_.jpg',
                'The power',
                isLive: true,
                context),
            buildBookItem(
                'https://m.media-amazon.com/images/I/81BE7eeKzAL._AC_UF1000,1000_QL80_.jpg',
                'The India',
                context),
            buildBookItem(
                'https://m.media-amazon.com/images/I/81BE7eeKzAL._AC_UF1000,1000_QL80_.jpg',
                'The India',
                context),
            buildBookItem(
                'https://m.media-amazon.com/images/I/81BE7eeKzAL._AC_UF1000,1000_QL80_.jpg',
                'The India',
                isLive: true,
                context),
          ]),
          buildSection('Motivation', [
            buildBookItem(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxt7BCwFVPS1KJ95jcdkhCsQNANnfQONUhHw&s',
                'The Invention',
                context),
            buildBookItem(
                'https://m.media-amazon.com/images/I/61jBLw5Bq9L._AC_UF1000,1000_QL80_.jpg',
                'Playing It',
                isLive: true,
                context),
            buildBookItem(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMUCCfI9-WvBW_urKk_v5UTIX1z2BssuXVuw&s',
                'The Hard Things',
                context),
            buildBookItem(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMUCCfI9-WvBW_urKk_v5UTIX1z2BssuXVuw&s',
                'The Hard Things',
                context),
            buildBookItem(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSMUCCfI9-WvBW_urKk_v5UTIX1z2BssuXVuw&s',
                'The Hard Things',
                context),
          ]),
        ],
      ),
    );
  }
}
