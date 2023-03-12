import 'package:clean_arch_linkedin/core/errors/failure.dart';
import 'package:clean_arch_linkedin/core/useCases/login_user_core.dart';
import 'package:clean_arch_linkedin/features/post/domain/repository/post_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/useCases/create_post.dart';

class CreatePostUseCase implements CreatePostParams<void, ParamsPost> {
  final PostRepo postRepository;

  CreatePostUseCase({required this.postRepository});
  @override
  Future<Either<Failure, String>> call(ParamsPost params) async {
    return await postRepository.createPost(
      description: params.description,
      pic: params.postImageURL,
    );
  }
}
