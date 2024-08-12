import 'package:clean_arch/core/params/params.dart';
import 'package:clean_arch/features/user/domain/repo/user_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../enitites/user_entity.dart';

class GetUser {
  final UserRepo _userRepo;

  GetUser(this._userRepo);
  Future<Either<Failure, UserEntitiy>> call({required UserParams params}) {
    return _userRepo.getUser(params: params);
  }
}
