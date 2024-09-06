import 'package:go_router/go_router.dart';
import 'package:news_app/features/auth/page/auth.dart';
import 'package:news_app/features/news/page/news.dart';
import 'package:news_app/features/news_feed/page/news_feed.dart';
import 'package:news_app/features/profile/page/profile.dart';
import 'package:news_app/features/splash_screen/page/splash_screen.dart';

final GoRouter routes = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) =>  const SplashScreenPage(),
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => const AuthPage(),
    ),
    GoRoute(
      path: '/news_feed',
      builder: (context, state) => const NewsFeedPage(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: '/news',
      builder: (context, state) {
        final Map<String, dynamic> news = state.extra as Map<String, dynamic>;
        return NewsPage(
          date: news['date'] as String,
          image: news['image'] as String,
          title: news['title'] as String,
          description: news['description'] as String?,
        );
      },
    ),
  ],
);
