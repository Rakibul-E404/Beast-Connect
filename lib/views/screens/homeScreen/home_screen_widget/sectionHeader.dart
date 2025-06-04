import 'package:flutter/material.dart';

Widget buildSectionHeader(String title) {
  return Row(
    children: [
      Text(
        title,
        style: const TextStyle(
          color: Colors.orange,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      const Spacer(),
      const Text(
        'See all',
        style: TextStyle(color: Colors.white70, fontSize: 12),
      )
    ],
  );
}