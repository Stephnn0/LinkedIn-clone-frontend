import 'dart:convert';

import 'package:clean_arch_linkedin/features/post/domain/entities/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel(
      {required super.id,
      required super.ownerId,
      required super.description,
      required super.name,
      required super.lastName,
      required super.postNameURL,
      required super.awsURL,
      required super.v});

  factory PostModel.fromMap(Map<String, dynamic> json) {
    return PostModel(
        id: json['_id'] ?? '',
        description: json['description'] ?? '',
        ownerId: json['ownerId'] ?? '',
        name: json['name'] ?? '',
        lastName: json['lastName'] ?? '',
        postNameURL: json['postNameURL'] ?? '',
        awsURL: json['awsURL'] ?? '',
        v: json['__vi']);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "ownerId": ownerId,
      "description": description,
      "name": name,
      "lastName": lastName,
      "postNameURL": postNameURL,
      "awsURL": awsURL,
    };
  }

  factory PostModel.fromJson(source) => PostModel.fromMap(json.decode(source));
}
