import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../data/models/post_model.dart';
import '../entities/post_entity.dart';

abstract class PostRepo {
  Future<Either<Failure, List<PostEntity>>> getAllPost();
  Future<Either<Failure, String>> createPost(
      {required String description, required File pic});
}
