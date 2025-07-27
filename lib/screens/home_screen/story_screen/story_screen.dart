import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

class StoryViewScreen extends StatefulWidget {
  const StoryViewScreen({super.key});

  @override
  _StoryViewScreenState createState() => _StoryViewScreenState();
}

class _StoryViewScreenState extends State<StoryViewScreen> {
  final StoryController _storyController = StoryController();

  @override
  void dispose() {
    _storyController.dispose(); // Dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // StoryView to display stories
          StoryView(
            storyItems: [
              StoryItem.pageImage(
                  url:
                      "https://images.unsplash.com/photo-1729016258424-317d0f05aa28?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  controller: _storyController,
                  caption: const Text('"Beautiful sunset",')),
              StoryItem.text(
                title: "Simple text story",
                backgroundColor: Colors.blue,
              ),
              StoryItem.pageImage(
                  url:
                      "https://images.unsplash.com/photo-1729016258424-317d0f05aa28?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  controller: _storyController,
                  caption: const Text(' "Another awesome view",')),
            ],
            controller: _storyController,
            onComplete: () {
              Navigator.pop(context);
            },
            repeat: false, // Don't repeat stories when finished
          ),

          // Profile info and close button overlay
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, top: 25.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://randomuser.me/api/portraits/men/75.jpg', // Test with a random image
                    ),
                    radius: 20,
                  ),
                  SizedBox(width: 10), // Add spacing between avatar and text
                  Text(
                    'nickname',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '3h',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
