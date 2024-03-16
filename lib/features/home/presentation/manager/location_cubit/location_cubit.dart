import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:muslim_app/core/cache/save_data.dart';
import 'package:muslim_app/core/cache/shared_preference.dart';
import 'package:muslim_app/core/services/location_service.dart';

import 'location_states.dart';

class LocationCubit extends Cubit<LocationStates> {
  LocationCubit() : super(InitialLocationState());

  static LocationCubit get(context) => BlocProvider.of(context);

  void getLocationAddress() async {
    String address = CacheHelper.getData(key: 'address') ?? '';
    if (address == '') {
      emit(LoadingGetLocationState());
      String message = await LocationService.handleLocationPermission();
      if (message == "") {
        Position location = await LocationService.getPosition();
        String address = await LocationService.getAddress(location: location);
        saveAddress(address);
        emit(SuccessGetLocationState(address));
      } else {
        emit(ErrorGetLocationState(message));
      }
    } else {
      emit(SuccessGetLocationState(address));
    }
  }
}
