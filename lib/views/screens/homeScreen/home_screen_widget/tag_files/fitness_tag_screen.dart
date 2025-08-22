import 'package:flutter/material.dart';

class FitnessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fitness'),
      ),
      body: Center(
        child: Text(
          'Fitness content goes here! Display fitness-related activities, articles, or events.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
