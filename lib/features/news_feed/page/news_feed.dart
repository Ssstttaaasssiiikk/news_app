import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/theme/color.dart';
import 'package:news_app/core/theme/theme.dart';
import 'package:news_app/features/news_feed/bloc/news_feed_bloc.dart';
import 'package:news_app/features/news_feed/widgets/post_widget.dart';

class NewsFeedPage extends StatelessWidget {
  const NewsFeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsFeedBloc()..add(GetPosts()),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor:  CustomColors.gray3,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => context.go('/profile'),
          ),
          title: Text(
            'Новости',
            style: textTheme.displayMedium,
          ),
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: NewsFeedView(),
          ),
        ),
      ),
    );
  }
}

class NewsFeedView extends StatelessWidget {
  const NewsFeedView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsFeedBloc, NewsFeedState>(
      builder: (context, state) {
        if (state is NewsFeedLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is NewsFeedLoaded) {
          return ListView.builder(
            itemCount: state.news.length,
            itemBuilder: (context, index) {
              final news = state.news[index];
              return PostWidget(
                onTap: () {
                  context.go('/news', extra: {
                    'date': news.date,
                    'image': news.image,
                    'title': news.name,
                    'description': news.description,
                  });
                },
                date: news.date,
                image: news.image,
                title: news.name,
              );
            },
          );
        } else if (state is NewsFeedError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Новостей нет'));
        }
      },
    );
  }
}
