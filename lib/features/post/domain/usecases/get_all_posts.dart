import 'package:clean_arch_linkedin/features/auth/domain/entities/user_entity.dart';
import 'package:clean_arch_linkedin/features/post/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/useCases/get_all_post.dart';
import '../../../../core/useCases/get_user_info.dart';
import '../repository/post_repo.dart';

class GetAllPost implements GetAllPostUseCase<List<PostEntity>, NoParams> {
  final PostRepo postRepository;

  GetAllPost({required this.postRepository});
  @override
  Future<Either<Failure, List<PostEntity>>> call(NoParams params) async {
    return await postRepository.getAllPost();
  }
}
