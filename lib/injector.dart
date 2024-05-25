import 'package:get_it/get_it.dart';
import 'package:pkp/features/post/data/repositories/post_repository_impl.dart';
import 'package:pkp/features/post/domain/repositories/post_repository.dart';
import 'package:pkp/features/post/presentation/bloc/post_bloc.dart';

final injector = GetIt.instance;

void injectorSetup() {
  /// It use to register any Repository and any State Management
  injector.registerLazySingleton<PostRepository>(() => PostRepositoryImpl());
  injector.registerSingleton<PostBloc>(
      PostBloc(postRepository: injector<PostRepository>())
  );
}