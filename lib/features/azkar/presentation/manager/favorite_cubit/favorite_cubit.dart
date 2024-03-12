import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/features/azkar/data/models/zeker_model.dart';
import 'package:muslim_app/features/azkar/domain/repo/azkar_repo.dart';
import 'favorite_states.dart';

class FavoriteCubit extends Cubit<FavoriteStates> {
  FavoriteCubit(this.azkarRepo) : super(InitialFavoriteState());
  static FavoriteCubit get(context) => BlocProvider.of(context);

  final AzkarRepo azkarRepo;

  void getFavorite() {
    List<Zekr> list = azkarRepo.getFavoriteAzkar();
    emit(SuccessGetFavorite(list));
  }

  void addFavoriteAzkar({required Zekr model}) async {
    List<Zekr> list = await azkarRepo.addFavoriteAzkar(model: model);
    emit(SuccessGetFavorite(list));
  }

  void deleteFavoriteAzkar({required Zekr model}) async {
    List<Zekr> list = await azkarRepo.deleteFavoriteAzkar(model: model);
    emit(SuccessGetFavorite(list));
  }
}
