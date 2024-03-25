import 'package:muslim_app/features/listen/domain/entites/reciter_entity.dart';

import 'moshaf.dart';

class ReciterModel extends ReciterEntity {
  int? id;
  String? name;
  String? letter;
  DateTime? date;
  List<Moshaf>? moshaf;

  ReciterModel({
    this.id,
    this.name,
    this.letter,
    this.date,
    this.moshaf,
  }) : super(
          reciterId: id ?? 0,
          reciterName: name ?? '',
          rewaya: (moshaf ?? [])
                  .where((element) => element.moshafType == 11)
                  .toList()
                  .isNotEmpty
              ? (moshaf ?? []).firstWhere((element) => element.moshafType == 11)
              : null,
        );

  factory ReciterModel.fromJson(Map<String, dynamic> json) => ReciterModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        letter: json['letter'] as String?,
        date: json['date'] == null
            ? null
            : DateTime.parse(json['date'] as String),
        moshaf: (json['moshaf'] as List<dynamic>?)
            ?.map((e) => Moshaf.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'letter': letter,
        'date': date?.toIso8601String(),
        'moshaf': moshaf?.map((e) => e.toJson()).toList(),
      };
}
