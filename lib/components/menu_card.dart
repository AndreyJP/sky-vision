import 'package:flutter/material.dart';

Card menuCard({IconData iconModel = Icons.error, String textMenu = '', Function()? clickFuncion}) {
  return Card(
    color: const Color(0xFF5569b0),
    margin: const EdgeInsets.symmetric(
      horizontal: 40,
      vertical: 25
    ),
    child: InkWell(
      onTap: clickFuncion,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconModel,
                size: 50,
                color: Colors.white,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                textMenu,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
