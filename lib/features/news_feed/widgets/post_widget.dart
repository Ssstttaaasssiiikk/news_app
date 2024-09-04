import 'package:flutter/material.dart';
import 'package:news_app/core/theme/theme.dart';

class PostWidget extends StatelessWidget {
  final String date;
  final String image;
  final String title;
  final VoidCallback onTap;

  const PostWidget({
    super.key,
    required this.date,
    required this.image,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Text(date, style: textTheme.titleSmall),
          const SizedBox(height: 10),
          Container(
            height: 145,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.grey),
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(title, style: textTheme.bodySmall),
        ],
      ),
    );
  }
}
