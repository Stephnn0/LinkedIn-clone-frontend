import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:clean_arch_linkedin/core/useCases/create_post.dart';
import 'package:clean_arch_linkedin/core/useCases/get_user_info.dart';
import 'package:clean_arch_linkedin/features/post/data/models/post_model.dart';
import 'package:clean_arch_linkedin/features/post/domain/entities/post_entity.dart';
import 'package:clean_arch_linkedin/features/post/domain/usecases/get_all_posts.dart';
import 'package:equatable/equatable.dart';

import '../../domain/usecases/create_post.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final CreatePostUseCase _createPostUseCase;
  final GetAllPost _getAllPost;

  PostBloc(
      {required CreatePostUseCase createPostUseCase,
      required GetAllPost getAllPost})
      : _getAllPost = getAllPost,
        _createPostUseCase = createPostUseCase,
        super(PostInitial()) {
    on<GetPostEvent>((event, emit) async {
      emit(Postloading());
      try {
        final posts = await _getAllPost.call(NoParams());

        posts.fold(
          (l) => emit(PostFailure()),
          (post) => emit(
            PostSuccess(postEntity: post),
          ),
        );
      } catch (err) {
        print(err);
      }
    });
    on<CreatePost>((event, emit) {
      final description = event.description;
      final postImagePath = event.postImagePath;

      final response = _createPostUseCase.call(
        ParamsPost(
          description: description,
          postImageURL: postImagePath,
        ),
      );
    });
  }
}
