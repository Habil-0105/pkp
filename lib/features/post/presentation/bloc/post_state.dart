part of 'post_bloc.dart';

enum PostStatus {
  initial,

  loadingCreate,
  loadingRead,
  loadingUpdate,
  loadingDelete,

  errorCreate,
  errorRead,
  errorUpdate,
  errorDelete,

  create,
  read,
  update,
  delete
}

class PostState extends Equatable{
  const PostState({
    this.status = PostStatus.initial,
    this.posts = const <PostModel>[],
    this.errorMsg = ""
  });

  final PostStatus status;
  final List<PostModel> posts;
  final String errorMsg;

  @override
  List<Object> get props => [status, posts, errorMsg];

  PostState copyWith({
    PostStatus? status,
    List<PostModel>? posts,
    String? errorMsg
  }) {
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      errorMsg: errorMsg ?? this.errorMsg,
    );
  }
}