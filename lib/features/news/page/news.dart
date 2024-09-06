import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/theme/color.dart';
import 'package:news_app/core/theme/theme.dart';

class NewsPage extends StatelessWidget {
  final String title;
  final String date;
  final String image;
  final String? description;
  const NewsPage({
    super.key,
    required this.title,
    required this.date,
    required this.image,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.gray3,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.go('/news_feed'),
        ),
        title: Text(
          title,
          style: textTheme.displayMedium,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              const SizedBox(height: 20),
              Text(
                description ?? 'Текст отсутсвует',
                style: textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
