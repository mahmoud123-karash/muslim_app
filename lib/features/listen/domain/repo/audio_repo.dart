import 'package:dartz/dartz.dart';
import 'package:muslim_app/core/errors/failure.dart';
import 'package:muslim_app/features/listen/data/models/audio_model/audio_model.dart';

abstract class AudioRepo {
  Future<Either<Failure, List<AudioModel>>> getAudioFiles({required int id});
}
