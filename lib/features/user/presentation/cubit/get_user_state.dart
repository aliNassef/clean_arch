import 'package:clean_arch/features/user/domain/enitites/user_entity.dart';

class GetUserState {}

class GetUserInitial extends GetUserState {}

class GetUserLoading extends GetUserState {}

class GetUserSuccess extends GetUserState {
  final UserEntitiy user;

  GetUserSuccess({required this.user});
}

class GetUserError extends GetUserState {
  final String errorMessage;
  GetUserError({required this.errorMessage});
}
