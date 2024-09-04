part of 'news_feed_bloc.dart';

abstract class NewsFeedState {}

class NewsFeedInitial extends NewsFeedState {}

class NewsFeedLoading extends NewsFeedState {}

class NewsFeedLoaded extends NewsFeedState {
  final List news;

  NewsFeedLoaded(this.news);
}

class NewsFeedError extends NewsFeedState {
  final String message;

  NewsFeedError(this.message);
}
