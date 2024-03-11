import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/contants/constants.dart';
import 'package:muslim_app/core/shared/assets.dart';
import 'package:muslim_app/core/utils/get_it.dart';
import 'package:muslim_app/features/auth/domain/use_cases/register_use_case.dart';
import 'package:muslim_app/features/auth/presentation/manager/register_cubit/register_cubit.dart';

import 'widgets/signup_content.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(
        getIt.get<RegisterUseCase>(),
      ),
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imagesRegister),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SafeArea(
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                iconTheme: IconThemeData(color: whiteColor),
                backgroundColor: Colors.transparent,
              ),
              body: const SignupContent(),
            ),
          ),
        ],
      ),
    );
  }
}
