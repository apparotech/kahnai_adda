import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kahaniadda/common_components/custom_text.dart';
import 'package:kahaniadda/const/brand_colors.dart';
import 'package:kahaniadda/screens/prime_screen/profile_screen/content_tab_view.dart';
import 'package:kahaniadda/screens/prime_screen/profile_screen/follow_following_screen.dart';
import 'package:kahaniadda/screens/prime_screen/profile_screen/posts_tab_view.dart';
import 'package:kahaniadda/screens/prime_screen/profile_screen/profile_edit_screen.dart';
import 'package:kahaniadda/screens/prime_screen/subscription_screen/subscription_screen.dart';
import 'package:kahaniadda/screens/setting_screen/setting_screen.dart';
import 'package:kahaniadda/utils/navigation_functions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// class ProfileScreen extends ConsumerWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return DefaultTabController(
//       length: 2, // Number of tabs
//       child: Scaffold(
//         backgroundColor: white,
//         appBar: AppBar(
//           backgroundColor: white,
//           title: customText(text: 'Profile', textcolor: black, fontsize: 16),
//           centerTitle: true,
//           actions: [
//             GestureDetector(
//                 onTap: () {
//                   pushToScreen(context, const SettingScreen());
//                 },
//                 child: const Icon(Icons.settings)),
//             const SizedBox(width: 10),
//             const Icon(Icons.share),
//             const SizedBox(width: 10),
//             InkWell(
//               onTap: () {
//                 pushToScreen(context, const SubscriptionScreen());
//               },
//               child: Image.asset(
//                 'assets/icons/go-prime.png',
//                 height: 30, // Set image height
//               ),
//             ),
//             const SizedBox(width: 10),
//           ],
//         ),
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 2.h),
//           child: Column(
//             children: [
//               const CircleAvatar(
//                 radius: 40,
//                 backgroundColor: grey,
//                 backgroundImage: NetworkImage(
//                     'https://images.unsplash.com/photo-1601412436009-d964bd02edbc?q=80&w=1528&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
//               ),
//               const SizedBox(height: 10),
//               customText(
//                 text: 'Username',
//                 textcolor: primary,
//                 fontsize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//               const SizedBox(height: 5),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 25.sp),
//                 child: customText(
//                   alignment: TextAlign.center,
//                   text:
//                       "Could you clarify what you're asking? Are you requesting a description of something in exactly 50 letters or a 50-word description? Let me know so I can assist you better!",
//                   textcolor: black,
//                   fontsize: 14,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 height: 100,
//                 decoration: const BoxDecoration(
//                   color: primary,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10),
//                   ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 30),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               pushToScreen(
//                                   context, const FollowFollowingScreen());
//                             },
//                             child: Column(
//                               children: [
//                                 customText(
//                                     text: '200',
//                                     textcolor: white,
//                                     fontsize: 16,
//                                     fontWeight: FontWeight.bold),
//                                 const SizedBox(height: 5),
//                                 customText(
//                                     text: 'Followers',
//                                     textcolor: white,
//                                     fontsize: 16,
//                                     fontWeight: FontWeight.bold),
//                               ],
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {
//                               pushToScreen(
//                                   context, const FollowFollowingScreen());
//                             },
//                             child: Column(
//                               children: [
//                                 customText(
//                                     text: '200',
//                                     textcolor: white,
//                                     fontsize: 16,
//                                     fontWeight: FontWeight.bold),
//                                 const SizedBox(height: 5),
//                                 customText(
//                                     text: 'Following',
//                                     textcolor: white,
//                                     fontsize: 16,
//                                     fontWeight: FontWeight.bold),
//                               ],
//                             ),
//                           ),
//                           Column(
//                             children: [
//                               customText(
//                                   text: '200',
//                                   textcolor: white,
//                                   fontsize: 16,
//                                   fontWeight: FontWeight.bold),
//                               const SizedBox(height: 5),
//                               customText(
//                                   text: 'Posts',
//                                   textcolor: white,
//                                   fontsize: 16,
//                                   fontWeight: FontWeight.bold),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const TabBar(
//                 tabs: [
//                   Tab(text: 'Contents'),
//                   Tab(text: 'Posts'),
//                 ],
//               ),
//               const SizedBox(
//                   height:
//                       10), // Add spacing between the container and the tab view
//               const Expanded(
//                 child: TabBarView(
//                   children: [
//                     ContentTabView(),
//                     PostsTabView(),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final ListName = [
    'Contents',
    'Posts',
  ];
  final listColors = [
    primary.withOpacity(.5),
    primary.withOpacity(.5),
  ];
  final listBoderColors = [
    primary,
    primary,
  ];
  bool isSelectColor = false;
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          title: customText(text: 'Profile', textcolor: black, fontsize: 16),
          centerTitle: true,
          actions: [
            GestureDetector(
                onTap: () {
                  pushToScreen(context, const SettingScreen());
                },
                child: const Icon(Icons.settings)),
            const SizedBox(width: 10),
            const Icon(Icons.share),
            const SizedBox(width: 10),
            InkWell(
              onTap: () {
                pushToScreen(context, const SubscriptionScreen());
              },
              child: Image.asset(
                'assets/icons/go-prime.png',
                height: 30, // Set image height
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: SingleChildScrollView(
          // Wrapping with SingleChildScrollView for full screen scrolling
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 2.h),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundColor: grey,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1601412436009-d964bd02edbc?q=80&w=1528&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                ),
                const SizedBox(height: 10),
                customText(
                  text: 'Username',
                  textcolor: primary,
                  fontsize: 18,
                  fontWeight: FontWeight.bold,
                ),
                Container(
                    child: IconButton(
                        onPressed: () {
                          pushToScreen(context, const EditProfileScreen());
                        },
                        icon: const Icon(Icons.edit_note_outlined))),
                const SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.sp),
                  child: customText(
                    alignment: TextAlign.center,
                    text:
                        "Could you clarify what you're asking? Are you requesting a description of something in exactly 50 letters or a 50-word description? Let me know so I can assist you better!",
                    textcolor: black,
                    fontsize: 14,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  height: 100,
                  decoration: const BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                pushToScreen(
                                    context, const FollowFollowingScreen());
                              },
                              child: Column(
                                children: [
                                  customText(
                                      text: '200',
                                      textcolor: white,
                                      fontsize: 16,
                                      fontWeight: FontWeight.bold),
                                  const SizedBox(height: 5),
                                  customText(
                                      text: 'Followers',
                                      textcolor: white,
                                      fontsize: 16,
                                      fontWeight: FontWeight.bold),
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                pushToScreen(
                                    context, const FollowFollowingScreen());
                              },
                              child: Column(
                                children: [
                                  customText(
                                      text: '200',
                                      textcolor: white,
                                      fontsize: 16,
                                      fontWeight: FontWeight.bold),
                                  const SizedBox(height: 5),
                                  customText(
                                      text: 'Following',
                                      textcolor: white,
                                      fontsize: 16,
                                      fontWeight: FontWeight.bold),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                customText(
                                    text: '200',
                                    textcolor: white,
                                    fontsize: 16,
                                    fontWeight: FontWeight.bold),
                                const SizedBox(height: 5),
                                customText(
                                    text: 'Posts',
                                    textcolor: white,
                                    fontsize: 16,
                                    fontWeight: FontWeight.bold),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 16.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(2, (index) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: BorderSide(color: listBoderColors[index]),
                          backgroundColor: selectedindex == index
                              ? isSelectColor
                                  ? Colors.transparent
                                  : listColors[index]
                              : Colors.white,
                          minimumSize: const Size(140, 40),
                        ),
                        onPressed: () {
                          setState(() {
                            selectedindex = index;
                          });
                          // Your onPressed callback function
                        },
                        child: Text(
                          ListName[index],
                          style: TextStyle(
                            color: selectedindex == index
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  children: [getView(selectedindex)],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget getView(int index) {
  switch (index) {
    case 0:
      return View1();

    case 1:
      return View2();
    default:
      return Container();
  }
}

class View1 extends StatefulWidget {
  const View1({super.key});

  @override
  State<View1> createState() => _View1State();
}

class _View1State extends State<View1> {
  @override
  Widget build(BuildContext context) {
    return const ContentTabView();
  }
}

class View2 extends StatefulWidget {
  const View2({super.key});

  @override
  State<View2> createState() => _View2State();
}

class _View2State extends State<View2> {
  @override
  Widget build(BuildContext context) {
    return const PostsTabView();
  }
}
