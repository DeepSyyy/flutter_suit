import 'package:flutter/material.dart';

class SuitmediaButton extends StatelessWidget {
  const SuitmediaButton(
      {super.key, required this.name, required this.onSubmit});
  final String name;
  final Function onSubmit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSubmit(),
      child: Container(
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color(0xff2B637B),
        ),
        child: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
