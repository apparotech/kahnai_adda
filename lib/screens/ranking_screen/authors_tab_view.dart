import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget authorsTabView() {
  return Column(
    children: [
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ChoiceChip(label: Text('Week'), selected: true),
            ChoiceChip(label: Text('Month'), selected: false),
            ChoiceChip(label: Text('All Time'), selected: false),
          ],
        ),
      ),
      SizedBox(height: 1.h),

      // Top 3 rankers
      Container(
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          color: Colors.purple[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar1.avif'),
                      radius: 40,
                    ),
                    Positioned(
                      bottom: 0,
                      child: Icon(Icons.emoji_events,
                          color: Colors.orange), // Rank icon for 2nd place
                    ),
                  ],
                ),
                Text("Abhisek Yadav"),
                Text("#2"),
              ],
            ),
            Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar2.avif'),
                      radius: 50,
                    ),
                    Positioned(
                      bottom: 0,
                      child: Icon(Icons.emoji_events,
                          color: Colors.yellow), // Rank icon for 1st place
                    ),
                  ],
                ),
                Text("Rahul Yadav"),
                Text("#1"),
              ],
            ),
            Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/avatar3.avif'),
                      radius: 40,
                    ),
                    Positioned(
                      bottom: 0,
                      child: Icon(Icons.emoji_events,
                          color: Colors.red), // Rank icon for 3rd place
                    ),
                  ],
                ),
                Text("Raj Mahto"),
                Text("#3"),
              ],
            ),
          ],
        ),
      ),

      SizedBox(height: 2.h),

      // Rankings list for Authors
      Expanded(
        child: ListView.builder(
          itemCount: 10, // Assuming you have 10 users to display
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage(
                      'assets/images/avatar${index % 3 + 1}.avif', // Load images from assets
                    ),
                  ),
                  title: Text('Author Name ${index + 4}'),
                  trailing: const Icon(Icons.emoji_events), // Rank icon
                  subtitle: Text('Rank ${index + 4}'),
                ),
              ),
            );
          },
        ),
      ),
    ],
  );
}
