import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news_feed/data/datasources/api_news_feed.dart';
import 'package:news_app/features/news_feed/data/models/news_model.dart';

part 'news_feed_event.dart';
part 'news_feed_state.dart';

class NewsFeedBloc extends Bloc<NewsFeedEvent, NewsFeedState> {
  NewsFeedBloc() : super(NewsFeedInitial()) {
    final apiNewsFeed = ApiNewsFeed();
    on<GetPosts>((event, emit) async {
      emit(NewsFeedLoading());
      try {
        List<News> newsResponse = await apiNewsFeed.fetchNews();
        List<News> postList = newsResponse;
        emit(NewsFeedLoaded(postList));
      } catch (e) {
        emit(NewsFeedError('Failed to fetch news'));
      }
    });
  }
}
