import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kahaniadda/common_components/custom_text.dart';
import 'package:kahaniadda/const/brand_colors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: white,
        elevation: 0,
        title: customText(
          text: 'Library',
          textcolor: black,
          fontsize: 18.sp,
        ),
        automaticallyImplyLeading: false,
        actions: [
          CircleAvatar(
            backgroundColor: Colors.black,
            child: Text(
              'RM',
              style: TextStyle(color: Colors.white),
            ),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Library and Recents Buttons
            Row(
              children: [
                _buildCategoryButton('Library'),
                SizedBox(width: 8),
                _buildCategoryButton('Recents'),
              ],
            ),
            SizedBox(height: 20),

            // Horizontal Scroll Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Favorite',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_forward, color: Colors.black),
              ],
            ),
            SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildBookCard(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRxt7BCwFVPS1KJ95jcdkhCsQNANnfQONUhHw&s',
                      'DDLJ',
                      '26.7 hrs',
                      '1M times read'),
                  SizedBox(width: 8),
                  _buildBookCard(
                      'https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781438008752/basic-word-list-9781438008752_hr.jpg',
                      'DDLJ',
                      '26.7 hrs',
                      '1M times read'),
                  SizedBox(width: 8),
                  _buildBookCard(
                      'https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781438008752/basic-word-list-9781438008752_hr.jpg',
                      'DDLJ',
                      '26.7 hrs',
                      '1M times read'),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Favorite Section
            const Text(
              'Favorite',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  _buildFavoriteCard(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTmMQD7Bra76pdetx8qjkjLgroSrXY-Vuuvg&s',
                      'Godan I'),
                  _buildFavoriteCard(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTmMQD7Bra76pdetx8qjkjLgroSrXY-Vuuvg&s',
                      'Brief History of Time'),
                  _buildFavoriteCard(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTmMQD7Bra76pdetx8qjkjLgroSrXY-Vuuvg&s',
                      'Brief History of Time'),
                  _buildFavoriteCard(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNlEmBLtjRHc_QatwhUZ4RqhbqgCawz4tI7Q&s',
                      'Book'),
                  _buildFavoriteCard(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNlEmBLtjRHc_QatwhUZ4RqhbqgCawz4tI7Q&s',
                      'Book'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Category Button Widget
  Widget _buildCategoryButton(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  // Horizontal Book Card Widget
  Widget _buildBookCard(
      String imagePath, String title, String duration, String timesRead) {
    return Container(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imagePath,
              height: 200,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          Text(
            duration,
            style: const TextStyle(color: grey),
          ),
          Text(
            timesRead,
            style: const TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // Favorite Book Card Widget
  Widget _buildFavoriteCard(String imagePath, String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imagePath,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          Icon(Icons.book, color: Colors.purple),
        ],
      ),
    );
  }
}
