import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kahaniadda/common_components/custom_text.dart';
import 'package:kahaniadda/const/brand_colors.dart';
import 'package:kahaniadda/screens/prime_screen/subscription_screen/subscription_screen.dart';
import 'package:kahaniadda/utils/navigation_functions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UpdateScreen extends ConsumerWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2, // Two tabs: Followers and Following
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: white,
          title: customText(text: 'Updates', textcolor: black, fontsize: 16),
          actions: [
            InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                pushToScreen(context, const SubscriptionScreen());
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/icons/go-prime.png',
                    height: 30, // Set image height
                  ),
                  SizedBox(height: 6.sp),
                  customText(
                      text: 'Go Prime',
                      textcolor: black,
                      fontsize: 12,
                      fontWeight: FontWeight.w500),
                ],
              ),
            ),
            SizedBox(width: 12.sp),
          ],
          bottom: const TabBar(
            indicatorColor: primary, // Custom indicator color
            labelColor: primary,
            unselectedLabelColor: grey,
            tabs: [
              Tab(text: 'Pots'),
              Tab(text: 'Creations'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            FollowerListView(),
            FollowingListView(),
          ],
        ),
      ),
    );
  }
}

class FollowerListView extends StatelessWidget {
  const FollowerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20, // Example item count, replace with dynamic data
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 10.sp, top: 10.sp),
          child: ListTile(
            leading: const CircleAvatar(
              radius: 26,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1601412436009-d964bd02edbc?q=80&w=1528&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), // Replace with your asset
            ),
            title: const Text('deepak posted in andriod app eveloper group'),
          ),
        );
      },
    );
  }
}

class FollowingListView extends StatelessWidget {
  const FollowingListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20, // Example item count, replace with dynamic data
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: 10.sp, top: 10.sp),
          child: ListTile(
            leading: const CircleAvatar(
              radius: 26,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1601412436009-d964bd02edbc?q=80&w=1528&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'), // Replace with your asset
            ),
            title: const Text('deepak posted in andriod app eveloper group'),
          ),
        );
      },
    );
  }
}
