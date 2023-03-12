import 'dart:io';

import 'package:clean_arch_linkedin/features/post/data/models/post_model.dart';
import 'package:clean_arch_linkedin/core/errors/failure.dart';
import 'package:clean_arch_linkedin/features/post/domain/repository/post_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/error.dart';
import '../dataSources/post_dataSource.dart';

class PostRepoImp implements PostRepo {
  final PostDataSource postDataSource;

  PostRepoImp({
    required this.postDataSource,
  });

  @override
  Future<Either<Failure, String>> createPost({
    required String description,
    required File pic,
  }) async {
    try {
      final response = await postDataSource.createPost(description, pic);
      return Right(response);
    } on ServerExeption catch (err) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<PostModel>>> getAllPost() async {
    try {
      final response = await postDataSource.getAllPost();
      return Right(response);
    } on ServerExeption catch (err) {
      return Left(ServerFailure());
    }
  }
}
