import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/core/sevices/services.dart';
import 'package:muslim_app/features/azkar/domain/repo/azkar_repo.dart';
import 'azkar_states.dart';

class AzkarCubit extends Cubit<AzkarStates> {
  AzkarCubit(this.azkarRepo) : super(InitialAzkarState());
  static AzkarCubit get(context) => BlocProvider.of(context);

  final AzkarRepo azkarRepo;

  List<String> categories = [];

  void getAzkar() async {
    var result = await azkarRepo.loadAzkar();
    result.fold(
      (message) {
        emit(ErrorLoadAzkar(message));
      },
      (list) {
        for (var element in list) {
          if (!categories.contains(element.category)) {
            categories.add(element.category);
          }
        }
        generateZekrOfDay(list);
        emit(SuccessLoadAzkar(list));
      },
    );
  }
}
