import 'package:hive/hive.dart';

part 'moshaf.g.dart';

@HiveType(typeId: 4)
class Moshaf {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? server;
  @HiveField(3)
  int? surahTotal;
  @HiveField(4)
  int? moshafType;
  @HiveField(5)
  String? surahList;

  Moshaf({
    this.id,
    this.name,
    this.server,
    this.surahTotal,
    this.moshafType,
    this.surahList,
  });

  factory Moshaf.fromJson(Map<String, dynamic> json) => Moshaf(
        id: json['id'] as int?,
        name: json['name'] as String?,
        server: json['server'] as String?,
        surahTotal: json['surah_total'] as int?,
        moshafType: json['moshaf_type'] as int?,
        surahList: json['surah_list'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'server': server,
        'surah_total': surahTotal,
        'moshaf_type': moshafType,
        'surah_list': surahList,
      };
}
