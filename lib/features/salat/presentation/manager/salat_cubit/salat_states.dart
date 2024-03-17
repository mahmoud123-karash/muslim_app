import 'package:muslim_app/features/salat/domain/entities/salat_entity.dart';

abstract class SalatStates {}

class InitailSalatState extends SalatStates {}

class LoadingGetPrayersState extends SalatStates {}

class SuccessGetPrayersState extends SalatStates {
  final List<SalatEntity> list;
  SuccessGetPrayersState(this.list);
}

class ErrorGetPrayersState extends SalatStates {
  final String message;
  ErrorGetPrayersState(this.message);
}
