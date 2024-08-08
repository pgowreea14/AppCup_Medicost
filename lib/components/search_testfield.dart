import 'package:flutter/material.dart';
import 'package:medicalapp/constants/constants.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the available height of the screen excluding the keyboard
    final double screenHeight = MediaQuery.of(context).size.height;
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final double availableHeight = screenHeight - keyboardHeight;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextFormField(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.mic,
            color: Colors.grey,
            size: 26,
          ),
          suffixIcon: const Icon(
            Icons.send,
            color: kPrimaryColor,
            size: 26,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: "Send Alert",
          labelStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          isDense: true,
        ),
        // Adjust the height of the TextFormField
        maxLines: 1,
        minLines: 1,
      ),
    );
  }
}
