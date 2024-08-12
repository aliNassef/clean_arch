import 'package:clean_arch/core/connection/network_info.dart';
import 'package:clean_arch/core/errors/exceptions.dart';
import 'package:clean_arch/core/errors/failure.dart';

import 'package:clean_arch/core/params/params.dart';
import 'package:clean_arch/features/user/data/data_source/user_remote_data_source.dart';

import 'package:clean_arch/features/user/domain/enitites/user_entity.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repo/user_repo.dart';
import '../data_source/user_local_data_source.dart';

class UserRepoImpl extends UserRepo {
  final NetworkInfo networkInfo;
  final UserRemoteDataSource userRemoteDataSource;
  final UserLocalDataSource userLocalDataSource;
  UserRepoImpl({
    required this.networkInfo,
    required this.userRemoteDataSource,
    required this.userLocalDataSource,
  });
  @override
  Future<Either<Failure, UserEntitiy>> getUser(
      {required UserParams params}) async {
    if (await networkInfo.isConnected!) {
      try {
        final remoteUser = await userRemoteDataSource.getUser(params);
        UserLocalDataSource.cacheUser(remoteUser);
        return Right(remoteUser);
      } on ServerException catch (e) {
        return Left(Failure(errMessage: e.errorModel.errorMessage));
      }
    } else {
      try {
        final localUser = await userLocalDataSource.getLastUser();
        return Right(localUser);
      } on CacheExeption catch (e) {
        return Left(Failure(errMessage: e.errorMessage));
      }
    }
  }
}
