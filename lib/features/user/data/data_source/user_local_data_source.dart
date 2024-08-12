import 'dart:convert';

import 'package:clean_arch/core/databases/cache/cache_helper.dart';
import 'package:clean_arch/core/errors/exceptions.dart';
import 'package:clean_arch/features/user/data/models/user_model.dart';

class UserLocalDataSource {
 static cacheUser(UserModel? user) {
    if (user != null) {
      CacheHelper().saveData(
        key: 'userToCache',
        value: json.encode(
          user.toJson(),
        ),
      );
    } else {
      throw CacheExeption(errorMessage: 'No internet connection');
    }
  }

  Future<UserModel> getLastUser() {
    final jsonString = CacheHelper().getDataString(key: 'userToCache');
    if (jsonString != null) {
      return Future.value(UserModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheExeption(errorMessage: 'No internet connection');
    }
  }
}
