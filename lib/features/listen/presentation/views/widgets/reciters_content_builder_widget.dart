import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/widgets/message_builder_widget.dart';
import 'package:muslim_app/features/listen/presentation/manager/reciter_cubit/reciter_cubit.dart';
import 'package:muslim_app/features/listen/presentation/manager/reciter_cubit/reciter_states.dart';
import 'package:muslim_app/features/listen/presentation/views/widgets/reciters_content_widget.dart';

class RecitersContentWidgetBuilderWidget extends StatelessWidget {
  const RecitersContentWidgetBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReciterCubit, ReciterStates>(
      builder: (context, state) {
        if (state is SuccessGetReciterDataState) {
          return RecitersContentWidgetWidget(
            reciters: state.reciters,
          );
        } else if (state is ErrorGetReciterDataState) {
          return MessageBuilderWidget(message: state.error);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
