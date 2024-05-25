import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pkp/features/post/data/models/post_model.dart';
import 'package:pkp/features/post/domain/repositories/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc({required this.postRepository}) : super(const PostState()) {
    on<FetchAllPost>(_onFetchAllPost);
    on<CreatePost>(_onCreatePost);
    on<UpdatePost>(_onUpdatePost);
    on<DeletePost>(_onDeletePost);
  }

  Future<void> _onFetchAllPost(FetchAllPost event, Emitter<PostState> emit)async{
    emit(state.copyWith(status: PostStatus.loadingRead));

    final response = await postRepository.fetchAllPost();

    if(response.error){
      emit(state.copyWith(
        status: PostStatus.errorRead,
        errorMsg: response.message
      ));

      return;
    }

    emit(state.copyWith(
      status: PostStatus.read,
      posts: response.data
    ));
  }

  Future<void> _onCreatePost(CreatePost event, Emitter<PostState> emit)async{
    emit(state.copyWith(status: PostStatus.loadingCreate));

    final response = await postRepository.createPost(title: event.title, body: event.body);

    if(response.error){
      emit(state.copyWith(
          status: PostStatus.errorCreate,
          errorMsg: response.message
      ));

      return;
    }

    emit(state.copyWith(status: PostStatus.create));
  }

  Future<void> _onUpdatePost(UpdatePost event, Emitter<PostState> emit)async{
    emit(state.copyWith(status: PostStatus.loadingUpdate));

    final response = await postRepository.updatePost(post: event.post);

    if(response.error){
      emit(state.copyWith(
          status: PostStatus.errorUpdate,
          errorMsg: response.message
      ));

      return;
    }

    emit(state.copyWith(status: PostStatus.update));
  }

  Future<void> _onDeletePost(DeletePost event, Emitter<PostState> emit)async{
    List<PostModel> posts = List.from(state.posts);
    List<PostModel> tempPosts = List.from(state.posts);

    posts.remove(event.post);

    emit(state.copyWith(
      status: PostStatus.loadingDelete,
      posts: posts
    ));

    final response = await postRepository.deletePost(id: event.post.id);

    if(response.error){
      emit(state.copyWith(
          status: PostStatus.errorDelete,
          errorMsg: response.message,
          posts: tempPosts
      ));

      return;
    }

    emit(state.copyWith(status: PostStatus.delete, posts: posts));
  }
}
