import 'dart:io';

import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AppStarted extends AuthEvent {}

class ChangeProfPic extends AuthEvent {
  final File file;

  ChangeProfPic(this.file);
  @override
  List<Object> get props => [file];
}

class LoggedIn extends AuthEvent {
  final String token;
  final String email;
  final String password;

  LoggedIn({required this.email, required this.password, this.token = ''});

  @override
  List<Object> get props => [token, email, password];
}

class Register extends AuthEvent {
  final String name;
  final String lastName;
  final String email;
  final String password;

  Register({
    required this.email,
    required this.password,
    required this.name,
    required this.lastName,
  });

  @override
  List<Object> get props => [name, lastName, email, password];
}

class LoggedOut extends AuthEvent {}
