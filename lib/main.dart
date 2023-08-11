// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_tiktok/config/theme/app_theme.dart';
import 'package:flutter_tiktok/infrastructure/datasources/local_video_datasource.dart';
import 'package:flutter_tiktok/infrastructure/repositories/video_posts_respository.dart';
import 'package:flutter_tiktok/presentation/providers/discover_provider.dart';
import 'package:flutter_tiktok/presentation/screens/discover/discover_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository =
        VideoPostsRepository(videosDatasource: LocalVideoDataSource());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false,
            create: (_) =>
                DiscoverProvider(videosRepository: videoPostRepository)
                  ..loadNextPage()),
      ],
      child: MaterialApp(
        title: 'TikTok',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: DiscoverScreen(),
      ),
    );
  }
}
