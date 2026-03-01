import 'daily_record.dart';

class Habit {
  String nama;
  String frekuensi;
  int target;
  String warna;
  List<DailyRecord> records;

  Habit({
    required this.nama,
    required this.frekuensi,
    required this.target,
    required this.warna,
    required this.records,
  });

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'frekuensi': frekuensi,
      'target': target,
      'warna': warna,
      'records': records.map((r) => r.toJson()).toList(),
    };
  }

  factory Habit.fromJson(Map<String, dynamic> json) {
    return Habit(
      nama: json['nama'] ?? '',
      frekuensi: json['frekuensi'] ?? '',
      target: json['target'] ?? 0,
      warna: json['warna'] ?? '',
      records: (json['records'] as List<dynamic>)
          .map((r) => DailyRecord.fromJson(r))
          .toList(),
    );
  }
}
