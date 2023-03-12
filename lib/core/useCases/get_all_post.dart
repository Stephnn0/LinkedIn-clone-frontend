import 'package:dartz/dartz.dart';

import '../errors/failure.dart';

abstract class GetAllPostUseCase<Type, NoParams> {
  Future<Either<Failure, Type>> call(NoParams params);
}
