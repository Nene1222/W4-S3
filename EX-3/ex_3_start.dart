import 'package:flutter/material.dart';

List<String> images = [
  "assets/bird.jpg",
  "assets/bird2.jpg",
  "assets/insect.jpg",
  "assets/girl.jpg",
  "assets/man.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // Hides the debug banner
      home: ImageViewer(),
    ));

class ImageViewer extends StatefulWidget {
  @override
  _ImageViewerState createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  int _currentIndex = 0; // State variable to track the current image index

  void _nextImage() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % images.length; // Cycle to the next image
    });
  }

  void _previousImage() {
    setState(() {
      _currentIndex = (_currentIndex - 1 + images.length) % images.length; // Cycle to the previous image
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image Viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: _previousImage,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: _nextImage,
            ),
          ),
        ],
      ),
      body: Center(
        child: Image.asset(images[_currentIndex]), // Display the current image
      ),
    );
  }
}