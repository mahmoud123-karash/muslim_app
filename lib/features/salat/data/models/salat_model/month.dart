class Month {
  int? number;
  String? en;
  String? ar;

  Month({this.number, this.en, this.ar});

  factory Month.fromJson(Map<String, dynamic> json) => Month(
        number: json['number'] as int?,
        en: json['en'] as String?,
        ar: json['ar'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'number': number,
        'en': en,
      };
}
