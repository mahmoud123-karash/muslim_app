import 'package:muslim_app/features/tafseer_vedio/data/models/tafseer_model/tafseer_model.dart';

abstract class VideoStates {}

class InitailVideoState extends VideoStates {}

class LoadingGetVideosState extends VideoStates {}

class SuccessGetVideosState extends VideoStates {
  final List<TafseerVideoModel> list;
  SuccessGetVideosState(this.list);
}

class ErrorGetVideosState extends VideoStates {
  final String message;
  ErrorGetVideosState(this.message);
}
