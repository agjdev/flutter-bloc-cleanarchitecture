import 'package:postblocapp/data/datasources/post_remote_datasource.dart';
import 'package:postblocapp/domain/entites/post_entity.dart';
import 'package:postblocapp/domain/repositories/post_repository.dart';

class PostRepoImpl extends PostRepo{

  PostRemoteDatasource postRemoteDatasource = PostRemoteDataSourceImpl();


  @override
  Future<List<PostEntity>> getPostFromDataSource() async{

    final posts = await postRemoteDatasource.getPostFromApi();
    return posts;

  }

}