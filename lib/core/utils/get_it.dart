import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:muslim_app/core/api/dio_helper.dart';
import 'package:muslim_app/features/auth/data/data_source/remote_data_source/user_remote_data_source.dart';
import 'package:muslim_app/features/auth/data/repo/auth_repo_impl.dart';
import 'package:muslim_app/features/auth/domain/use_cases/register_use_case.dart';
import 'package:muslim_app/features/azkar/data/data_sources/local_data_source/azkar_local_data_source.dart';
import 'package:muslim_app/features/azkar/data/data_sources/local_data_source/favorite_local_data_source.dart';
import 'package:muslim_app/features/azkar/data/repo/azkar_repo_impl.dart';
import 'package:muslim_app/features/listen/data/data_source/audio_remote_data_source.dart';
import 'package:muslim_app/features/listen/data/data_source/reciter_local_data_source.dart';
import 'package:muslim_app/features/listen/data/data_source/reciter_remote_data_source.dart';
import 'package:muslim_app/features/listen/data/repo/audio_repo_imol.dart';
import 'package:muslim_app/features/listen/data/repo/reciter_repo_impl.dart';
import 'package:muslim_app/features/listen/domain/use_cases/download_use_case.dart';
import 'package:muslim_app/features/profile/data/repo/profile_repo_impl.dart';
import 'package:muslim_app/features/salat/data/data_source/local_data_source/local_remote_data_source.dart';
import 'package:muslim_app/features/salat/data/data_source/remote_data_source/salat_remote_data_source.dart';
import 'package:muslim_app/features/salat/data/repo/salat_repo_impl.dart';

GetIt getIt = GetIt.instance;

void setLocator() {
  getIt.registerSingleton(
    AuthRepoImpl(
      UserRemoteDataSourceImpl(),
    ),
  );

  getIt.registerSingleton<RegisterUseCase>(
    RegisterUseCase(
      getIt.get<AuthRepoImpl>(),
    ),
  );

  getIt.registerSingleton(
    AzkarRepoImpl(
      AzkarLocalDataSourceImpl(),
      FavoriteLocalDataSourceImpl(),
    ),
  );

  getIt.registerSingleton<DioHelper>(
    DioHelper(
      Dio(),
    ),
  );
  getIt.registerSingleton<ReciterRepoImpl>(
    ReciterRepoImpl(
      ReciterRemoteDataSourceImpl(
        getIt.get<DioHelper>(),
      ),
      ReciterLocalDataSourceImpl(),
    ),
  );

  getIt.registerSingleton<AudioRepoImpl>(
    AudioRepoImpl(
      AudioRemoteDataSourceImpl(
        getIt.get<DioHelper>(),
      ),
    ),
  );

  getIt.registerSingleton<DownloadUseCase>(
    DownloadUseCase(
      getIt.get<AudioRepoImpl>(),
      getIt.get<DioHelper>(),
    ),
  );

  getIt.registerSingleton<ProfileRepoImpl>(
    ProfileRepoImpl(),
  );

  getIt.registerSingleton(
    SalatRepImpl(
      SalatRemoteDataSourceImpl(
        getIt.get<DioHelper>(),
      ),
      SalatLocalDataSourceImpl(),
    ),
  );
}
