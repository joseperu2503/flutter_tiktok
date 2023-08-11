import 'package:flutter_tiktok/domain/datasources/video_posts_data_source.dart';
import 'package:flutter_tiktok/domain/entities/video_post.dart';
import 'package:flutter_tiktok/infrastructure/models/local_video_model.dart';
import 'package:flutter_tiktok/shared/data/local_video_posts.dart';

class LocalVideoDataSource implements VideoPostDatasource {
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    await Future.delayed(const Duration(seconds: 3));
    final List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    return newVideos;
  }
}
