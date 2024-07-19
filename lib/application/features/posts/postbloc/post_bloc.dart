import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:postblocapp/domain/entites/post_entity.dart';
import 'package:postblocapp/domain/usecases/post_usescase.dart';


part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostRequestedEvent>((event, emit) async {

      print("bloc intialized ");

      try{
        final posts = await PostUsescase().getPostFromDataSource();
        emit(PostStateLoaded(posts: posts));
      }
      catch(e){
        emit(PostError(message: e.toString()));
      }

    });
  }
}