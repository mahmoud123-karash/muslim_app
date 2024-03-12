import 'package:muslim_app/features/azkar/data/models/zeker_model.dart';

abstract class AzkarStates {}

class InitialAzkarState extends AzkarStates {}

class LoadingLoadAzkar extends AzkarStates {}

class SuccessLoadAzkar extends AzkarStates {
  final List<Zekr> list;
  SuccessLoadAzkar(this.list);
}

class ErrorLoadAzkar extends AzkarStates {
  final String message;
  ErrorLoadAzkar(this.message);
}
