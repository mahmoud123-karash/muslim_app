class Tasfseer {
  final int id;
  final int surahNum;
  final int ayahNum;
  final String text;

  Tasfseer({
    required this.id,
    required this.surahNum,
    required this.ayahNum,
    required this.text,
  });

  factory Tasfseer.fromJson(Map<String, dynamic> json) {
    return Tasfseer(
      ayahNum: json['aya'],
      id: json['id'],
      surahNum: json['sura'],
      text: json['text'],
    );
  }
}
