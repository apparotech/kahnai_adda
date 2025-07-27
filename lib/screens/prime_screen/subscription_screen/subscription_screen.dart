import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kahaniadda/common_components/custom_text.dart';
import 'package:kahaniadda/const/brand_colors.dart';
import 'package:kahaniadda/screens/prime_screen/subscription_screen/coins_tab_view.dart';
import 'package:kahaniadda/screens/prime_screen/subscription_screen/prime_tab_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SubscriptionScreen extends ConsumerStatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SubscriptionScreenState();
}

class _SubscriptionScreenState extends ConsumerState<SubscriptionScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // Added semicolon
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: customText(text: 'Prime', textcolor: black, fontsize: 16),
        backgroundColor: white,
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 44),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 1.h, left: 2.w, right: 2.w),
              child: TabBar(
                controller: _tabController,
                labelColor: primary, // Selected label color
                unselectedLabelColor: black, // Unselected label color
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 0, // Remove default indicator
                indicator: BoxDecoration(
                  color: grey.withOpacity(.2), // Selected tab background color
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
                tabs: const [
                  Tab(text: 'Prime'),
                  Tab(text: 'Coins'),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          // Content for "For You" tab
          PrimeTabView(),
          CoinScreen(),
        ],
      ),
    );
  }
}
