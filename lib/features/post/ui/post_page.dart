import 'package:blog_eg/features/post/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../styles/text_styles.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final PostBloc postBloc = PostBloc();
  @override
  void initState() {
    postBloc.add(PostInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Posts")),
        backgroundColor: Colors.red,
      ),
      body: BlocConsumer(
          bloc: postBloc,
          listenWhen: (previous, current) => current is PostActionState,
          buildWhen: (previous, current) => current is! PostActionState,
          listener: (context, state) {
            // do stuff here based on BlocA's state
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              case PostFetchLoadingState:
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.redAccent,
                  ),
                );
              case PostFetchSuccessState:
                final successState = state as PostFetchSuccessState;
                return Container(
                  child: ListView.builder(
                    itemCount: successState.posts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(0xCCA6D6FF),
                        ),
                        margin: EdgeInsets.only(top: index == 0 ? 15: 5, bottom: 10, left: 10, right: 10),
                        padding: EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              successState.posts[index].title,
                              style: textTitle,
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              successState.posts[index].body,
                              style: textBody,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              default:
                return Container(
                  child: Text(
                    "Posts are empty",
                    style: textTitle,
                  ),
                );
            }
            // return widget here based on BlocA's state
          }),
    );
  }
}
