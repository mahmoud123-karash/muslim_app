abstract class AyahStates {}

class InitialAyahState extends AyahStates {}

class SuccessLoadTafseertate extends AyahStates {}

class SuccessPlayAyahtate extends AyahStates {}

class SuccessStopAyahtate extends AyahStates {}

class ErrorPlayAudioState extends AyahStates {
  final String message;
  ErrorPlayAudioState(this.message);
}
