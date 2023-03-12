import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failure.dart';

abstract class CreatePostParams<Type, ParamsPost> {
  Future<Either<Failure, Type>> call(ParamsPost params);
}

class ParamsPost extends Equatable {
  final String description;
  final File postImageURL;
  const ParamsPost({
    required this.description,
    required this.postImageURL,
  });

  @override
  List<Object?> get props => [description, postImageURL];
}
