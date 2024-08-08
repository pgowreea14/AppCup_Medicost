import 'package:flutter/material.dart';

AppBar appBar(BuildContext context) {
  return AppBar(
    backgroundColor: Color.fromARGB(255, 250, 253, 251),
    title: Text(
      "MediCost",
      style: TextStyle(
        color: Colors.black, // Adjust color as needed
      ),
    ),
    actions: [
      IconButton(
        icon: Image.asset(
          'assets/icons/star.png', // Path to your image asset
          width: 30, // Set the desired width
          height: 30, // Set the desired height
          color: Colors.black, // Optionally apply color if needed
        ),
        onPressed: () {
          // Add your notification logic here
        },
      )
    ],
  );
}
