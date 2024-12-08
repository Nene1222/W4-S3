import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Selectable Buttons Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableButton(text: 'Button 1'),
              SizedBox(height: 16),
              SelectableButton(text: 'Button 2'),
              SizedBox(height: 16),
              SelectableButton(text: 'Button 3'),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectableButton extends StatefulWidget {
  final String text;

  SelectableButton({required this.text});

  @override
  _SelectableButtonState createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;

  String get buttonText => isSelected ? 'Selected' : 'Not Selected';

  Color get textColor => isSelected ? Colors.white : Colors.black;

  Color get backgroundColor => isSelected ? Colors.blue[500]! : Colors.blue[50]!;

  void toggleSelection() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: toggleSelection,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}