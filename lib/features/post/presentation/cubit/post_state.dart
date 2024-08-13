import 'package:clean_arch/features/post/domain/entities/post_entitiy.dart';

class PostState {}

final class PostInitial extends PostState {}

final class PostLoaded extends PostState {
  final PostEntity postEntity;

  PostLoaded({required this.postEntity});
}

final class PostFailure extends PostState {
  final String errMessage;

  PostFailure({required this.errMessage});
}

final class PostLoading extends PostState {}
