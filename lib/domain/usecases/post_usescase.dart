import 'package:postblocapp/data/repositories/post_repo_impl.dart';
import 'package:postblocapp/domain/entites/post_entity.dart';

import '../repositories/post_repository.dart';

class PostUsescase {
  PostRepo  postRepo = PostRepoImpl();
  Future<List<PostEntity>> getPostFromDataSource() async {
      final posts= await postRepo.getPostFromDataSource();
      return posts;

  }
}
