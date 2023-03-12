import 'dart:io';

import 'package:clean_arch_linkedin/core/errors/error.dart';
import 'package:clean_arch_linkedin/features/auth/data/dataSources/auth_data_source.dart';
import 'package:clean_arch_linkedin/features/auth/data/models/user_model.dart';
import 'package:clean_arch_linkedin/features/auth/domain/entities/user_entity.dart';
import 'package:clean_arch_linkedin/features/auth/domain/repository/auth_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

class AuthRepoImp implements AuthRepo {
  final AuthDataSource authDataSource;

  AuthRepoImp({required this.authDataSource});

  //---------------------------------------------------------

  @override
  Future<Either<Failure, String>> handleLogin({
    required String email,
    required String password,
  }) async {
    try {
      final response = await authDataSource.handleLogin(
        email,
        password,
      );
      return Right(response);
    } on ServerExeption catch (err) {
      return Left(ServerFailure());
    }
  }

  //---------------------------------------------------------

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }

  //---------------------------------------------------------

  @override
  Future<Either<Failure, UserModel>> getUserInfo(String ownerId) async {
    try {
      final response = await authDataSource.getUserInfo(ownerId);
      return Right(response);
    } on ServerExeption catch (err) {
      return Left(ServerFailure());
    }
  }

  //---------------------------------------------------------

  @override
  Future<Either<Failure, String>> changeProfImg({required File file}) async {
    try {
      final response = await authDataSource.changeProfilePic(file);
      return Right(response);
    } on ServerExeption catch (err) {
      return Left(ServerFailure());
    }
  }

  //---------------------------------------------------------

  @override
  Future<Either<Failure, String>> handleRegister(
      {required String email,
      required String password,
      required String name,
      required String lastName}) async {
    try {
      final response =
          await authDataSource.handleRegister(email, password, name, lastName);
      return Right(response);
    } on ServerExeption catch (err) {
      return Left(ServerFailure());
    }
  }
}
