import 'package:flutter/material.dart';

Widget buildSectionHeader(String title) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      const Spacer(),
      const Text(
        'See all',
        style: TextStyle(color: Colors.white70, fontSize: 14),
      )
    ],
  );
}