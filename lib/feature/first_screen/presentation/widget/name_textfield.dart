import 'package:flutter/material.dart';

class SuitmediaTextFieldName extends StatelessWidget {
  const SuitmediaTextFieldName({super.key, required this.controllerName});
  final TextEditingController controllerName;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controllerName,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        labelText: 'Name',
      ),
    );
  }
}
