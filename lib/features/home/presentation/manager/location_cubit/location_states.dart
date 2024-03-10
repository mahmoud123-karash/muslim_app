abstract class LocationStates {}

class InitialLocationState extends LocationStates {}

class LoadingGetLocationState extends LocationStates {}

class SuccessGetLocationState extends LocationStates {
  final String address;
  SuccessGetLocationState(this.address);
}

class ErrorGetLocationState extends LocationStates {
  final String message;
  ErrorGetLocationState(this.message);
}
