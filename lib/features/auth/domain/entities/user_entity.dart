import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

class UserEntity extends Equatable {
  final String id;
  final String email;
  final String name;
  final String lastName;
  final String profilePic;
  final String bannerPic;
  final String job;
  final String bio;

  const UserEntity(
    this.id,
    this.email,
    this.name,
    this.lastName,
    this.profilePic,
    this.bannerPic,
    this.job,
    this.bio,
  );
  @override
  List<Object?> get props => [
        id,
        email,
        name,
        lastName,
        profilePic,
        bannerPic,
        bio,
        job,
      ];
}

//------------------------------------------------------------------------------
enum EmailValidationError { invalid }

class Email extends FormzInput<String, EmailValidationError> {
  const Email.pure() : super.pure('');

  const Email.dirty([super.value = '']) : super.dirty();

  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailValidationError? validator(String? value) {
    return _emailRegExp.hasMatch(value ?? '')
        ? null
        : EmailValidationError.invalid;
  }
}

//------------------------------------------------------------------------------

enum PasswordValidationError { invalid }

class Password extends FormzInput<String, PasswordValidationError> {
  const Password.pure() : super.pure('');

  const Password.dirty([super.value = '']) : super.dirty();

  static final _passwordRegExp =
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');

  @override
  PasswordValidationError? validator(String? value) {
    return _passwordRegExp.hasMatch(value ?? '')
        ? null
        : PasswordValidationError.invalid;
  }
}
