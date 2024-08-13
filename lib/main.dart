import 'package:clean_arch/core/DI/dependency_injuction.dart';
import 'package:clean_arch/core/databases/cache/cache_helper.dart';
import 'package:clean_arch/features/user/presentation/cubit/get_user_cubit.dart';
import 'package:clean_arch/features/user/presentation/views/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper().init();
  await setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => GetuserCubit()..getUser(1),
        child: const UserScreen(),
      ),
    );
  }
}
