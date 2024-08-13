import 'package:clean_arch/features/post/data/datasources/post_local_data_source.dart';
import 'package:clean_arch/features/user/data/data_source/user_local_data_source.dart';
import 'package:clean_arch/features/user/data/data_source/user_remote_data_source.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../features/post/data/datasources/post_remote_data_source.dart';
import '../connection/network_info.dart';
import '../databases/api/dio_consumer.dart';
import '../databases/cache/cache_helper.dart';

GetIt getIt = GetIt.instance;

setupGetIt() async {
  await CacheHelper().init();
  getIt.registerSingleton<DioConsumer>(
    DioConsumer(
      dio: Dio(),
    ),
  );

  getIt.registerSingleton(
    NetworkInfoImpl(internetConnectionChecker: InternetConnectionChecker()),
  );
  getIt.registerSingleton(UserRemoteDataSource(api: getIt.get<DioConsumer>()));
  getIt.registerSingleton(UserLocalDataSource());
  getIt.registerSingleton(PostLocalDataSource(cache: getIt.get<CacheHelper>()));
  getIt.registerSingleton(PostRemoteDataSource(api: getIt.get<DioConsumer>()));
}
