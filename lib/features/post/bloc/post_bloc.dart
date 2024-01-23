import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:blog_eg/features/post/model/post_data_model.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostInitialFetchEvent>(postInitialFetchEvent);
  }

  FutureOr<void> postInitialFetchEvent(
      PostInitialFetchEvent event, Emitter<PostState> emit) async {
    emit(PostFetchLoadingState());
    List<PostDataModel> posts = [];

    var client = http.Client();
    try {
      var response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      print(response.body);

      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        posts.add(
            PostDataModel.fromJson(result[i] as Map<String, dynamic>));
      }
      print(posts);

      emit(PostFetchSuccessState(posts: posts));
    } catch (e) {
      emit(PostFetchFailState());
      log(e.toString());
    }
  }
}
