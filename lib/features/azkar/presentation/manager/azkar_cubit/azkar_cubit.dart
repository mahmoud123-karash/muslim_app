import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/services/services.dart';
import 'package:muslim_app/features/azkar/domain/repo/azkar_repo.dart';
import 'azkar_states.dart';

class AzkarCubit extends Cubit<AzkarStates> {
  AzkarCubit(this.azkarRepo) : super(InitialAzkarState());
  static AzkarCubit get(context) => BlocProvider.of(context);

  final AzkarRepo azkarRepo;

  void getAzkar() async {
    var result = await azkarRepo.loadAzkar();
    result.fold(
      (message) {
        emit(ErrorLoadAzkar(message));
      },
      (list) {
        generateZekrOfDay(list);
        emit(SuccessLoadAzkar(list));
      },
    );
  }
}
