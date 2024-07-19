import 'package:flutter/material.dart';
import 'package:postblocapp/application/core/services/theme_service.dart';
import 'package:postblocapp/application/features/posts/postbloc/post_bloc.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostWrapper extends StatelessWidget {
  const PostWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(),
      child: PostPage(),
    );
  }
}

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themedata = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Post App Using Bloc",
          style: themedata.textTheme.titleMedium,
        ),
        actions: [
          Switch(
            activeColor: Colors.green,
            value: Provider.of<ThemeServiceProvider>(context).isDarkModeOn,
            onChanged: (_) {
              Provider.of<ThemeServiceProvider>(context, listen: false)
                  .toggleTheme();
            },
          ),
          IconButton(
            onPressed: () {
              BlocProvider.of<PostBloc>(context).add(PostRequestedEvent());
            },
            icon: Icon(Icons.refresh_outlined),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "All Posts",
              style: themedata.textTheme.displayLarge,
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: BlocBuilder<PostBloc, PostState>(
                builder: (context, state) {
                  if (state is PostInitial) {
                    return Text("Your posts are waiting to be loaded");
                  } else if (state is PostStateLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    );
                  } else if (state is PostStateLoaded) {
                    return ListView.builder(
                      itemCount: state.posts.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Center(
                                child: Text("${index + 1}"),
                              ),
                            ),
                            title: Text("${state.posts[index].title}"),
                            subtitle: Text("${state.posts[index].body}"),
                          ),
                        );
                      },
                    );
                  } else if (state is PostError) {
                    return Center(
                      child: Text(state.message),
                    );
                  } else {
                    return SizedBox.shrink(); // Added to handle any other state
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
