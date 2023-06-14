import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
    leading: const Icon(Icons.sunny),
    title: const Text(
      'Sky Vision', style: TextStyle(
        fontSize: 20,
      ),
    ),
    backgroundColor: const Color(0xFF2a4688),
  );
}