abstract class LogoutStates {}

class InitailLogoutState extends LogoutStates {}

class LoadingLogoutState extends LogoutStates {}

class SuccessLogoutState extends LogoutStates {}

class ErrorLogoutState extends LogoutStates {
  final String message;
  ErrorLogoutState(this.message);
}
