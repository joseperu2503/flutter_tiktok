import 'package:flutter_tiktok/domain/datasources/video_posts_data_source.dart';
import 'package:flutter_tiktok/domain/entities/video_post.dart';
import 'package:flutter_tiktok/domain/repositories/video_post_repository.dart';

class VideoPostsRepository implements VideoPostRepository {
  final VideoPostDatasource videosDatasource;

  VideoPostsRepository({required this.videosDatasource});

  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userID) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDatasource.getTrendingVideosByPage(page);
  }
}
