import 'package:flutter/material.dart';
import 'package:news_app/core/theme/color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: TextField(
        controller: controller,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.phone,
        decoration: const InputDecoration(
          filled: true,
          fillColor: CustomColors.lightGray,
          border: InputBorder.none,
          isDense: true,
        ),
      ),
    );
  }
}
