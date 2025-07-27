import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kahaniadda/common_components/custom_text.dart';
import 'package:kahaniadda/const/brand_colors.dart';
import 'package:kahaniadda/screens/ranking_screen/authors_tab_view.dart';
import 'package:kahaniadda/screens/ranking_screen/books_tab_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
// Make sure to include the sizer package for responsive sizing

class RankingDashboard extends StatefulWidget {
  @override
  _RankingDashboardState createState() => _RankingDashboardState();
}

class _RankingDashboardState extends State<RankingDashboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        scrolledUnderElevation: 0,
        elevation: 0,
        title: customText(text: 'Ranking', textcolor: black, fontsize: 18.sp),
        backgroundColor: white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
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
          SizedBox(width: 3.w), // Responsive space between avatar and edge
        ],
      ),
      body: Column(
        children: [
          // Custom TabBar with rounded corners
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
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
                  Tab(text: 'Authors'),
                  Tab(text: 'Books'),
                ],
              ),
            ),
          ),

          SizedBox(height: 1.h),

          // Tab content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Authors tab
                authorsTabView(),

                // Books tab
                booksTabView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
