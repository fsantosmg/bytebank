import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final IconData? icone;
  final TextInputType? textInputType;

  Editor({this.controller, this.labelText, this.hintText, this.icone, this.textInputType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: labelText,
          hintText: hintText,
        ),
        keyboardType: textInputType != null? textInputType : TextInputType.number,
      ),
    );
  }
}
