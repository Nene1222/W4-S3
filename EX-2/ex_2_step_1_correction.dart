import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FavoriteCards(),
      ),
    );
  }
}

class FavoriteCard extends StatefulWidget {
  final String title;
  final String description;

  FavoriteCard({
    required this.title,
    required this.description,
  });

  @override
  _FavoriteCardState createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool _isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text(widget.description),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(_isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.red),
                  onPressed: _toggleFavorite,
                ),
              ],
            ),
            SizedBox(height: 8),
            Divider(
              color: Colors.grey[300],
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteCards extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        FavoriteCard(
          title: 'Card 1',
          description: 'This is the first card',
        ),
        FavoriteCard(
          title: 'Card 2',
          description: 'This is the second card',
        ),
        FavoriteCard(
          title: 'Card 3',
          description: 'This is the third card',
        ),
      ],
    );
  }
}