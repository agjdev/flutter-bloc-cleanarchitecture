import 'dart:convert';

import 'package:postblocapp/domain/entites/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({required title, required body, required userId, required id})
      : super(title: title, body: body, userId: userId, id: id);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
        title: json['title'],
        body: json['body'],
        userId: json['userId'],
        id: json['id']);
  }
}
