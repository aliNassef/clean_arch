import 'package:clean_arch/core/DI/dependency_injuction.dart';
import 'package:clean_arch/core/connection/network_info.dart';
import 'package:clean_arch/core/params/params.dart';
import 'package:clean_arch/features/user/data/data_source/user_local_data_source.dart';
import 'package:clean_arch/features/user/data/data_source/user_remote_data_source.dart';
import 'package:clean_arch/features/user/data/repo/user_repo_impl.dart';
import 'package:clean_arch/features/user/domain/usecases/get_user.dart';
import 'package:clean_arch/features/user/presentation/cubit/get_user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetuserCubit extends Cubit<GetUserState> {
  GetuserCubit() : super(GetUserInitial());

  getUser(int id) async {
    emit(GetUserLoading());
    var data = await GetUser(
      UserRepoImpl(
        networkInfo: getIt.get<NetworkInfoImpl>(),
        userRemoteDataSource: getIt.get<UserRemoteDataSource>(),
        userLocalDataSource: getIt.get<UserLocalDataSource>(),
      ),
    ).call(params: UserParams(id: id.toString()));
    data.fold(
      (l) {
        emit(GetUserError(errorMessage: l.errMessage));
      },
      (r) {
        emit(GetUserSuccess(user: r));
      },
    );
  }
}
