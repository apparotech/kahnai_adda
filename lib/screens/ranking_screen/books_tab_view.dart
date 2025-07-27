import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget booksTabView() {
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

      // Top 3 ranked books
      Container(
        padding: const EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 5.w),
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 60,
                      width: 50,
                      color: Colors.grey,
                      child: Image.asset(
                        'assets/images/book1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(
                      bottom: 0,
                      child: Icon(Icons.book,
                          color: Colors.white), // Rank icon for 2nd place
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                const Text("Book Title 2"),
                const Text("#2"),
              ],
            ),
            Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 80,
                      width: 70,
                      color: Colors.grey,
                      child: Image.asset(
                        'assets/images/book2.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(
                      bottom: 0,
                      child: Icon(Icons.book,
                          color: Colors.white), // Rank icon for 2nd place
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                const Text("Book Title 1"),
                const Text("#1"),
              ],
            ),
            Column(
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: 60,
                      width: 50,
                      color: Colors.grey,
                      child: Image.asset(
                        'assets/images/book3.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(
                      bottom: 0,
                      child: Icon(Icons.book,
                          color: Colors.white), // Rank icon for 2nd place
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                const Text("Book Title 3"),
                const Text("#3"),
              ],
            ),
          ],
        ),
      ),

      SizedBox(height: 2.h),

      // Rankings list for Books
      Expanded(
        child: ListView.builder(
          itemCount: 10, // Assuming you have 10 books to display
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 5.w),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  leading: Container(
                    height: 50,
                    width: 40,
                    color: Colors.grey,
                    child: Image.asset('assets/images/book1.jpg'),
                  ),
                  title: Text('Book Title ${index + 4}'),
                  trailing: const Icon(Icons.book), // Rank icon
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
