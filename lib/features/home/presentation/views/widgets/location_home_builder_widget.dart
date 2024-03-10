import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/features/home/presentation/manager/location_cubit/location_cubit.dart';
import 'package:muslim_app/features/home/presentation/manager/location_cubit/location_states.dart';
import 'package:muslim_app/features/home/presentation/views/widgets/home_row_widget.dart';

class LocationHomeBuilderWidget extends StatelessWidget {
  const LocationHomeBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationStates>(
      listener: (context, state) {
        if (state is ErrorGetLocationState) {
          showSnackBar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state is SuccessGetLocationState) {
          return HomeRowWidget(
            lable: state.address,
            icon: Ionicons.location_outline,
            onPressed: () {
              CacheHelper.removeData(key: 'address');
              LocationCubit.get(context).getLocationAddress();
            },
          );
        } else {
          return Container();
        }
      },
    );
  }
}
