part of 'post_bloc.dart';

@immutable
abstract class PostState {
  @override
  List<Object> get props=>[];
}

class PostInitial extends PostState {
  @override
  List<Object> get props=>[];
}


class PostStateLoading extends PostState {}

class PostStateLoaded extends PostState {

  List<PostEntity> posts;

  PostStateLoaded({required this.posts});
  @override
  List<Object> get props=>[];


}

class PostError extends PostState {

  final message;

  PostError({required this.message});



}



