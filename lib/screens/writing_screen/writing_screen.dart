import 'package:flutter/material.dart';

class WritingScreen extends StatefulWidget {
  const WritingScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WritingScreenState createState() => _WritingScreenState();
}

class _WritingScreenState extends State<WritingScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  bool isBold = false;
  bool isItalic = false;
  bool isUnderline = false;

  void _undo() {
    // Add your undo logic here
    print("Undo action");
  }

  void _redo() {
    // Add your redo logic here
    print("Redo action");
  }

  void _toggleBold() {
    setState(() {
      isBold = !isBold;
    });
  }

  void _toggleItalic() {
    setState(() {
      isItalic = !isItalic;
    });
  }

  void _toggleUnderline() {
    setState(() {
      isUnderline = !isUnderline;
    });
  }

  void _insertImage() {
    // Add your image insertion logic here
    print("Insert image");
  }

  void _clearText() {
    _contentController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[100],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Post',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.save, color: Colors.black),
            onPressed: () {
              // Save post logic here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Title TextField
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: Colors.purple[200]),
                filled: true,
                fillColor: Colors.purple[50],
              ),
            ),
            SizedBox(height: 8),
            // Content TextField with character count
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Content',
                  style: TextStyle(color: Colors.purple[200]),
                ),
                Text(
                  '${_contentController.text.length}/150',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Expanded(
              child: TextField(
                controller: _contentController,
                maxLines: null,
                expands: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
                onChanged: (text) {
                  setState(() {}); // Update character count
                },
              ),
            ),
            SizedBox(height: 8),
            // Bottom Toolbar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.undo, color: Colors.black),
                  onPressed: _undo,
                ),
                IconButton(
                  icon: Icon(Icons.redo, color: Colors.black),
                  onPressed: _redo,
                ),
                IconButton(
                  icon: Icon(Icons.format_bold,
                      color: isBold ? Colors.purple : Colors.black),
                  onPressed: _toggleBold,
                ),
                IconButton(
                  icon: Icon(Icons.format_italic,
                      color: isItalic ? Colors.purple : Colors.black),
                  onPressed: _toggleItalic,
                ),
                IconButton(
                  icon: Icon(Icons.format_underline,
                      color: isUnderline ? Colors.purple : Colors.black),
                  onPressed: _toggleUnderline,
                ),
                IconButton(
                  icon: Icon(Icons.image, color: Colors.black),
                  onPressed: _insertImage,
                ),
                IconButton(
                  icon: Icon(Icons.clear, color: Colors.black),
                  onPressed: _clearText,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
