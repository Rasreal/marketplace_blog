part of 'post_bloc.dart';

@immutable
abstract class PostState {}

class PostInitial extends PostState {}

abstract class PostActionState extends PostState{}

class PostFetchLoadingState extends PostState{}
class PostFetchFailState extends PostState{}

class PostFetchSuccessState extends PostState{
  final List<PostDataModel> posts;

  PostFetchSuccessState({required this.posts});

}
