part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class GetPostEvent extends PostEvent {}

class CreatePost extends PostEvent {
  final String description;
  final File postImagePath;

  const CreatePost({
    required this.description,
    required this.postImagePath,
  });

  @override
  List<Object> get props => [description, postImagePath];
}

class PostRequestCompleted extends PostEvent {}
