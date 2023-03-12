import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failure.dart';

abstract class ChangeProImgUseCase<Type, ParamsChangeProImg> {
  Future<Either<Failure, Type>> call(ParamsChangeProImg params);
}

class ParamsChangeProImg extends Equatable {
  final File profileImage;
  const ParamsChangeProImg({
    required this.profileImage,
  });

  @override
  List<Object?> get props => [profileImage];
}
