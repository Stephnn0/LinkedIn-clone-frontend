import 'package:clean_arch_linkedin/core/errors/failure.dart';
import 'package:clean_arch_linkedin/core/useCases/get_user_info.dart';
import 'package:clean_arch_linkedin/features/auth/domain/entities/user_entity.dart';
import 'package:clean_arch_linkedin/features/auth/domain/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';

class GetUserInfo implements GetUserInfoParams<UserEntity, ParamsGetUserInfo> {
  final AuthRepo authRepo;

  GetUserInfo({required this.authRepo});

  @override
  Future<Either<Failure, UserEntity>> call(ParamsGetUserInfo params) async {
    return await authRepo.getUserInfo(params.ownerId);
  }
}
