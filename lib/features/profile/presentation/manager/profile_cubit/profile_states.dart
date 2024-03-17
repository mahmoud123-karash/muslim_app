abstract class ProfileStates {}

class InitialProfileState extends ProfileStates {}

class SuccessUpdateProfileState extends ProfileStates {}

class LoadingUpdateProfileState extends ProfileStates {}

class ErrorUpdateProfileState extends ProfileStates {
  final String message;
  ErrorUpdateProfileState(this.message);
}
