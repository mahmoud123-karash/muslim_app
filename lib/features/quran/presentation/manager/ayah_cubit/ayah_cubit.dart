import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:muslim_app/core/sevices/json_service.dart';
import 'package:muslim_app/core/shared/components.dart';
import 'package:muslim_app/features/quran/data/models/tafseer_model.dart';
import 'package:muslim_app/features/quran/presentation/manager/ayah_cubit/ayah_states.dart';
import 'package:audioplayers/audioplayers.dart';

class AyahCubit extends Cubit<AyahStates> {
  AyahCubit() : super(InitialAyahState());
  static AyahCubit get(context) => BlocProvider.of(context);

  List<Tasfseer> list = [];

  String getTafsser(int num) {
    List<Tasfseer> tafseerList =
        list.where((element) => element.id == num).toList();
    return list.isEmpty ? '' : tafseerList.first.text;
  }

  Future<void> loadTafseer() async {
    String jsonString = await rootBundle.loadString(JsonService.tafseer);
    List<dynamic> jsonResponse = jsonDecode(jsonString);
    list = jsonResponse.map((s) => Tasfseer.fromJson(s)).toList();
    emit(SuccessLoadTafseertate());
  }

  final player = AudioPlayer();
  bool isPaly = false;

  void playAudio({
    required String uri,
    required BuildContext context,
    required String message,
  }) async {
    try {
      bool isConnected = await InternetConnectionChecker().hasConnection;
      if (isConnected) {
        player.play(UrlSource(uri)).then((value) {
          isPaly = true;
          player.onPlayerComplete.listen((event) {
            stopAudio();
          });
          emit(SuccessPlayAyahtate());
        });
      } else {
        showToast(message);
      }
    } catch (e) {
      emit(ErrorPlayAudioState(e.toString()));
    }
  }

  void pauseAudio() {
    player.pause().then((value) {
      isPaly = false;
      emit(SuccessStopAyahtate());
    }).catchError((error) {
      emit(ErrorPlayAudioState(error.toString()));
    });
  }

  void stopAudio() {
    player.stop().then((value) {
      isPaly = false;
      emit(SuccessStopAyahtate());
    }).catchError((error) {
      emit(ErrorPlayAudioState(error.toString()));
    });
  }
}
