import 'package:muslim_app/features/azkar/data/models/zeker_model.dart';

abstract class FavoriteStates {}

class InitialFavoriteState extends FavoriteStates {}

class SuccessGetFavorite extends FavoriteStates {
  final List<Zekr> list;
  SuccessGetFavorite(this.list);
}
