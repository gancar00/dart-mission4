class DailyRecord {
  String tanggal;
  bool isSelesai;

  DailyRecord({
    required this.tanggal,
    required this.isSelesai,
  });

  Map<String, dynamic> toJson() {
    return {
      'tanggal': tanggal,
      'isSelesai': isSelesai,
    };
  }

  factory DailyRecord.fromJson(Map<String, dynamic> json) {
    return DailyRecord(
      tanggal: json['tanggal'] ?? '',
      isSelesai: json['isSelesai'] ?? false,
    );
  }
}
