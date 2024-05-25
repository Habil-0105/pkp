import 'package:pkp/features/post/data/models/post_model.dart';
import 'package:pkp/shared/services/network/api_response.dart';

abstract class PostRepository{
  Future<ApiResponse<List<PostModel>>> fetchAllPost();
  Future<ApiResponse<dynamic>> createPost({required String title, required String body});
  Future<ApiResponse<dynamic>> updatePost({required PostModel post});
  Future<ApiResponse<dynamic>> deletePost({required int id});
}