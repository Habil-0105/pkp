import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pkp/features/post/data/models/post_model.dart';
import 'package:pkp/features/post/domain/repositories/post_repository.dart';
import 'package:pkp/shared/services/network/api_response.dart';
import 'package:pkp/shared/services/network/interceptors/logging_interceptor.dart';
import 'package:pkp/shared/services/network/network_client.dart';
import 'package:pkp/shared/services/network/url.dart';
import 'package:pkp/shared/utils/constants/api_constant.dart';
import 'package:uuid/uuid.dart';

class PostRepositoryImpl extends PostRepository{
  final NetworkClient _client = NetworkClient(
    dioClient: Dio(BaseOptions(baseUrl: Url.baseURL)),
    interceptors: [
      LoggingInterceptor()
    ],
  );

  @override
  Future<ApiResponse> createPost({required String title, required String body})async{
    try{
      var uuid = const Uuid();
      var jsonData = {
        ApiConstant.title : title,
        ApiConstant.body : body,
        ApiConstant.userId : uuid.v4(),
      };

      final response = await _client.post(
          endpoint: Url.post(PostEndpoint.create),
          data: json.encode(jsonData)
      );

      ApiResponse<dynamic> apiResponse = ApiResponse(
          data: null,
          code: response.statusCode!,
          message: "",
          error: false
      );

      return apiResponse;
    } on DioException catch(e){
      return _client.errorParser(e);
    }
  }

  @override
  Future<ApiResponse> deletePost({required int id})async{
    try{
      final response = await _client.delete(
          endpoint: Url.post(PostEndpoint.delete, id: id)
      );

      ApiResponse<dynamic> apiResponse = ApiResponse(
          data: null,
          code: response.statusCode!,
          message: "",
          error: false
      );

      return apiResponse;
    } on DioException catch(e){
      return _client.errorParser(e);
    }
  }

  @override
  Future<ApiResponse> updatePost({required PostModel post})async{
    try{
      var jsonData = {
        ApiConstant.id : post.id,
        ApiConstant.title : post.title,
        ApiConstant.body : post.body,
        ApiConstant.userId : post.userId,
      };

      final response = await _client.put(
          endpoint: Url.post(PostEndpoint.update, id: post.id),
          data: json.encode(jsonData)
      );

      ApiResponse<dynamic> apiResponse = ApiResponse(
          data: null,
          code: response.statusCode!,
          message: "",
          error: false
      );

      return apiResponse;
    } on DioException catch(e){
      return _client.errorParser(e);
    }
  }

  @override
  Future<ApiResponse<List<PostModel>>> fetchAllPost()async{
    try{
      final response = await _client.get(
        endpoint: Url.post(PostEndpoint.read,),
      );

      ApiResponse<List<PostModel>> apiResponse = ApiResponse(
          data: (response.data as Iterable).map((e) => PostModel.fromJson(e)).toList(),
          code: response.statusCode!,
          message: "",
          error: false
      );

      return apiResponse;
    } on DioException catch(e){
      return _client.errorParser(e);
    }
  }
}