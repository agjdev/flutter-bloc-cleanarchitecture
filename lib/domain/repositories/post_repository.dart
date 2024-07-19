import 'package:postblocapp/domain/entites/post_entity.dart';

abstract class PostRepo{

  Future<List<PostEntity>> getPostFromDataSource();
}