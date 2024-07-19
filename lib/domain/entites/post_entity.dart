import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final String? title;
  final String? body;

  int id;
  int userId;

  PostEntity(
      {required this.id,
      required this.userId,
      required this.title,
      required this.body});

  @override
  // TODO: implement props
  List<Object?> get props => [this.title, this.userId, this.id, this.body];
}
