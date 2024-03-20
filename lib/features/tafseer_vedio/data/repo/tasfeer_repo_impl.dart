import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:muslim_app/features/tafseer_vedio/data/data_sources/remote_data_source/tafseer_remote_data_source.dart';
import 'package:muslim_app/features/tafseer_vedio/data/models/tafseer_model/tafseer_model.dart';
import 'package:muslim_app/features/tafseer_vedio/domain/repo/tafseer_repo.dart';

class TafseerRepoImpl extends TafseerRepo {
  final TafseerRemoteDataSource tafseerRemoteDataSource;

  TafseerRepoImpl(this.tafseerRemoteDataSource);

  var fireStore = FirebaseFirestore.instance.collection('tafseer');
  @override
  Future<Either<String, List<TafseerVideoModel>>> getData() async {
    try {
      List<TafseerVideoModel> list = await tafseerRemoteDataSource.get();
      return right(list);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<TafseerVideoModel>>> addNewTafseer({
    required String personName,
    required String tafseerTitle,
    required String vedioUri,
  }) async {
    try {
      TafseerVideoModel model = TafseerVideoModel(
        personName: personName,
        tafseerTitle: tafseerTitle,
        vedioUri: vedioUri,
        date: Timestamp.now(),
      );
      await fireStore.add(model.toJson());
      List<TafseerVideoModel> list = await tafseerRemoteDataSource.get();
      return right(list);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<TafseerVideoModel>>> editTafseer({
    required String uid,
    required String personName,
    required String tafseerTitle,
    required String vedioUri,
  }) async {
    try {
      TafseerVideoModel model = TafseerVideoModel(
        personName: personName,
        tafseerTitle: tafseerTitle,
        vedioUri: vedioUri,
        date: Timestamp.now(),
      );
      await fireStore.doc(uid).update(model.toJson());
      List<TafseerVideoModel> list = await tafseerRemoteDataSource.get();
      return right(list);
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<TafseerVideoModel>>> removeTafseer({
    required String uid,
  }) async {
    try {
      await fireStore.doc(uid).delete();
      List<TafseerVideoModel> list = await tafseerRemoteDataSource.get();
      return right(list);
    } catch (e) {
      return left(e.toString());
    }
  }
}
