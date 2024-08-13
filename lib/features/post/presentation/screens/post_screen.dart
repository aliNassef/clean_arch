import 'package:clean_arch/features/post/presentation/cubit/post_cubit.dart';
import 'package:clean_arch/features/post/presentation/cubit/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocProvider(
      create: (context) => PostCubit()..getPosts(),
      child: const SafeArea(
        child: PostsViewBody(),
      ),
    ));
  }
}

class PostsViewBody extends StatelessWidget {
  const PostsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (context, state) {
        if (state is PostLoaded) {
          return Column(
            children: [
              Text(state.postEntity.title),
              Text(state.postEntity.body),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
