import 'package:flutter/material.dart';

class SuitmediaAlertDialog extends StatelessWidget {
  const SuitmediaAlertDialog({super.key, required this.isPalindrome});
  final String isPalindrome;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("is Palindrome?"),
      content: Text(isPalindrome),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
