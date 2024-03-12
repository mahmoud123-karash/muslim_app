import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/widgets/message_builder_widget.dart';
import 'package:muslim_app/features/azkar/presentation/manager/azkar_cubit/azkar_cubit.dart';
import 'package:muslim_app/features/azkar/presentation/manager/azkar_cubit/azkar_states.dart';
import 'package:muslim_app/features/azkar/presentation/views/widgets/azkar_content_widget.dart';

class AzkarContentBuilderWidget extends StatelessWidget {
  const AzkarContentBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AzkarCubit, AzkarStates>(
      builder: (context, state) {
        if (state is SuccessLoadAzkar) {
          return AzkarContentWidget(
            list: state.list,
          );
        } else if (state is ErrorLoadAzkar) {
          return MessageBuilderWidget(message: state.message);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
