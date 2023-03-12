import 'dart:io';

import 'package:clean_arch_linkedin/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> handleLogin({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> handleRegister({
    required String email,
    required String password,
    required String name,
    required String lastName,
  });

  Future<Either<Failure, UserEntity>> getUserInfo(String ownerId);

  Future<Either<Failure, String>> changeProfImg({
    required File file,
  });
}
