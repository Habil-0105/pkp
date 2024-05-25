part of 'post_bloc.dart';

abstract class PostEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class FetchAllPost extends PostEvent{}

class CreatePost extends PostEvent{
  final String title;
  final String body;

  CreatePost({required this.title, required this.body});
}

class UpdatePost extends PostEvent{
  final PostModel post;

  UpdatePost({required this.post});
}

class DeletePost extends PostEvent{
  final PostModel post;

  DeletePost({required this.post});
}