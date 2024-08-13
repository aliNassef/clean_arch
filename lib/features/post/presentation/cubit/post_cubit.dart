import 'package:clean_arch/core/DI/dependency_injuction.dart';
import 'package:clean_arch/core/connection/network_info.dart';
import 'package:clean_arch/core/params/params.dart';
import 'package:clean_arch/features/post/data/datasources/post_local_data_source.dart';
import 'package:clean_arch/features/post/data/datasources/post_remote_data_source.dart';
import 'package:clean_arch/features/post/data/repositories/post_repository_impl.dart';
import 'package:clean_arch/features/post/domain/usecases/get_post.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostInitial());
  getPosts() async {
    emit(PostLoading());
    var data = await GetPost(
        repository: PostRepositoryImpl(
      networkInfo: getIt.get<NetworkInfoImpl>(),
      localDataSource: getIt.get<PostLocalDataSource>(),
      remoteDataSource: getIt.get<PostRemoteDataSource>(),
    )).call(params: PostParams(id: 5.toString()));
    data.fold(
      (l) => emit(PostFailure(
        errMessage: l.errMessage,
      )),
      (ifRight) => emit(PostLoaded(
        postEntity: ifRight,
      )),
    );
  }
}
