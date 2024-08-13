import 'package:clean_arch/features/user/presentation/cubit/get_user_state.dart';
import 'package:clean_arch/features/user/presentation/widgets/custom_search_app_bar.dart';
import 'package:clean_arch/features/user/presentation/widgets/landing_widget.dart';
import 'package:clean_arch/features/user/presentation/widgets/user_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/get_user_cubit.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetuserCubit, GetUserState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: state is GetUserSuccess
              ? ListView(
                  children: [
                    const LandingWidget(),
                    UserData(user: state.user),
                    const CustomSearchBar(),
                  ],
                )
              : state is GetUserError
                  ? Text(state.errorMessage)
                  : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
