import 'package:dio/dio.dart';
import 'package:news_app/features/news_feed/data/models/news_model.dart';

class ApiNewsFeed {
  Future<List<News>> fetchNews() async {
    try {
      final dio = Dio();
      final response = await dio.get('https://webstripe.ru/list.json');

      if (response.statusCode == 200) {
        final data = response.data;

        if (data != null && data['news'] is List) {
          final List<dynamic> newsList = data['news'];
          return newsList.map((json) => News.fromJson(json)).toList();
        } else {
          throw Exception('Данные "news" не найдены или не являются списком');
        }
      } else {
        throw Exception('Ошибка загрузки данных: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Произошла ошибка: $e');
    }
  }
}
