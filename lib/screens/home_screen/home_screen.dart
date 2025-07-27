import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kahaniadda/common_components/custom_text.dart';
import 'package:kahaniadda/const/brand_colors.dart';
import 'package:kahaniadda/screens/choose_language_screen/choose_language_screen.dart';
import 'package:kahaniadda/screens/home_screen/categories_tab_view.dart';
import 'package:kahaniadda/screens/home_screen/for_you_tab_view.dart';
import 'package:kahaniadda/screens/home_screen/test.dart';
import 'package:kahaniadda/screens/prime_screen/profile_screen/profile_screen.dart';
import 'package:kahaniadda/screens/prime_screen/subscription_screen/subscription_screen.dart';
import 'package:kahaniadda/screens/ranking_screen/ranking_screen.dart';
import 'package:kahaniadda/utils/navigation_functions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
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
        backgroundColor: white,
        elevation: 0,
        centerTitle: true,
        title: customText(
            text: 'Kahani Addaa',
            textcolor: black,
            fontsize: 16,
            fontWeight: FontWeight.bold),
        leading: IconButton(
          onPressed: () {
            pushToScreen(context, const ChooseLanguageScreen());
            // Add your navigation or language change logic here
          },
          icon: Image.asset(
            'assets/icons/languange.png',
            height: 30,
          ),
        ),
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
          SizedBox(width: 3.w), // Responsive space between avatar and edge
        ],
        bottom: PreferredSize(
          preferredSize:
              const Size(double.infinity, 100), // Adjust size of the bottom row
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                    vertical: 1.h), // Add some padding around the row
                child: Row(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        pushToScreen(context, RankingDashboard());
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/icons/ranking.png',
                            height: 30, // Set image height
                          ),
                          SizedBox(height: 6.sp),
                          customText(
                              text: 'Ranking',
                              textcolor: black,
                              fontsize: 12,
                              fontWeight: FontWeight.w500),
                        ],
                      ),
                    ),
                    SizedBox(
                        width: 2.w), // Spacing between image and text field
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 2.w),
                        margin: EdgeInsets.symmetric(horizontal: 2.w),
                        decoration: BoxDecoration(
                          color: primary.withOpacity(.2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                cursorColor: primary.withOpacity(.7),
                                decoration: const InputDecoration(
                                  hintText: "Search by book name",
                                  hintStyle: TextStyle(color: grey),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10),
                                  border: InputBorder.none, // Removes underline
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.search,
                              color: grey,
                              size: 26,
                            ),
                            SizedBox(width: 2.w),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                        width:
                            2.w), // Spacing between text field and second image
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
                    )
                  ],
                ),
              ),
              // TabBar
              Container(
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
                      color:
                          grey.withOpacity(.2), // Selected tab background color
                      borderRadius:
                          BorderRadius.circular(20), // Rounded corners
                    ),
                    tabs: const [
                      Tab(text: 'For You'),
                      Tab(text: 'Categories'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          // Content for "For You" tab
          ForYouTabViews(),
          // Content for "Categories" tab
          CategoriesTabView(
            isStoryActive: true,
          ),
        ],
      ),
    );
  }
}
