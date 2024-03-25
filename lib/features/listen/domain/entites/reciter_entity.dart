import 'package:hive/hive.dart';
import 'package:muslim_app/features/listen/data/models/reciter_model/moshaf.dart';
part 'reciter_entity.g.dart';

@HiveType(typeId: 1)
class ReciterEntity {
  @HiveField(0)
  final int reciterId;
  @HiveField(1)
  final String reciterName;
  @HiveField(2)
  Moshaf? rewaya;

  ReciterEntity({
    required this.reciterId,
    required this.reciterName,
    this.rewaya,
  });
}
