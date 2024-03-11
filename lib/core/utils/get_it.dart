import 'package:get_it/get_it.dart';
import 'package:muslim_app/features/auth/data/data_source/remote_data_source/user_remote_data_source.dart';
import 'package:muslim_app/features/auth/data/repo/auth_repo_impl.dart';
import 'package:muslim_app/features/auth/domain/use_cases/register_use_case.dart';

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
}
