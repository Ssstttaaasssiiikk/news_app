import 'package:json_annotation/json_annotation.dart';

part 'news_model.g.dart';

@JsonSerializable()
class News {
  final String id;
  final String name;
  final String image;
  final String date;
  final String? description;

  News({
    required this.id,
    required this.name,
    required this.image,
    required this.date,
    this.description,
  });

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
