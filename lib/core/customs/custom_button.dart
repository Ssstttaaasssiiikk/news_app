import 'package:flutter/material.dart';
import 'package:news_app/core/theme/color.dart';
import 'package:news_app/core/theme/theme.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const Button({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.gray,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          elevation: 0,
          shadowColor: Colors.transparent,
          side: BorderSide.none,
        ),
        child: Text(
          text,
          style: textTheme.displayMedium,
        ),
      ),
    );
  }
}
