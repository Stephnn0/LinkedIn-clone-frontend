import 'dart:io';

import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final String? id;
  final String? ownerId;
  final String? description;

  final String? name;
  final String? lastName;

  final String? postNameURL;
  final String? awsURL;
  final Null? v;

  const PostEntity({
    required this.id,
    required this.ownerId,
    required this.description,
    required this.name,
    required this.lastName,
    required this.postNameURL,
    required this.awsURL,
    required this.v,
  });

  @override
  List<Object?> get props =>
      [id, ownerId, description, name, lastName, postNameURL, awsURL, v];
}
