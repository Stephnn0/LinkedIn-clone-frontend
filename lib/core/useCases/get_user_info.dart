import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failure.dart';

abstract class GetUserInfoParams<Type, ParamsGetUserInfo> {
  Future<Either<Failure, Type>> call(ParamsGetUserInfo params);
}

class ParamsGetUserInfo extends Equatable {
  final String ownerId;

  const ParamsGetUserInfo({required this.ownerId});

  @override
  List<Object?> get props => [];
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
