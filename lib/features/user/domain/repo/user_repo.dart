import 'package:clean_arch/core/errors/failure.dart';
import 'package:clean_arch/core/params/params.dart';
import 'package:dartz/dartz.dart';

import '../enitites/user_entity.dart';

abstract class UserRepo {
  Future<Either<Failure, UserEntitiy>> getUser({required UserParams params});
}
