part of 'post_bloc.dart';

enum PostEventStatus { initial, loading, success, failure }

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class Postloading extends PostState {}

class PostSuccess extends PostState {
  final List<PostEntity> postEntity;

  const PostSuccess({required this.postEntity});
}

class PostFailure extends PostState {}
