import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failure.dart';

abstract class RegisterUserParams<Type, ParamsRegister> {
  Future<Either<Failure, Type>> call(ParamsRegister params);
}

class ParamsRegister extends Equatable {
  final String email;
  final String password;
  final String name;
  final String lastName;

  const ParamsRegister({
    required this.name,
    required this.lastName,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password, name, password];
}
