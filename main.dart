import 'dart:convert';
import 'habit.dart';
import 'daily_record.dart';

void main() {
  List<Habit> daftarHabit = [
    Habit(
      nama: "Bootcamp Hari Senin",
      frekuensi: "Setiap Hari",
      target: 5,
      warna: "Biru",
      records: [
        DailyRecord(tanggal: "2026-03-01", isSelesai: true),
        DailyRecord(tanggal: "2026-03-02", isSelesai: false),
      ],
    ),
    Habit(
      nama: "Kerja Rodi",
      frekuensi: "Setiap Hari",
      target: 2,
      warna: "Hijau",
      records: [
        DailyRecord(tanggal: "2026-03-01", isSelesai: true),
        DailyRecord(tanggal: "2026-03-02", isSelesai: true),
      ],
    ),
    Habit(
      nama: "Olahraga",
      frekuensi: "3x Seminggu",
      target: 30,
      warna: "Kuning",
      records: [
        DailyRecord(tanggal: "2026-03-01", isSelesai: false),
        DailyRecord(tanggal: "2026-03-02", isSelesai: true),
      ],
    ),
  ];

  // 🔹 Tampilkan status awal
  print("=== STATUS DAILY RECORD (OBJECT ASLI) ===");

  for (var habit in daftarHabit) {
    print("\nHabit: ${habit.nama}");
    for (var record in habit.records) {
      print(
          "Tanggal: ${record.tanggal} | Status: ${record.isSelesai ? "Selesai" : "Belum"}");
    }
  }

  // =====================================================
  // OBJECT → JSON
  // =====================================================
  print("\n=== OBJECT KE JSON ===");

  List<Map<String, dynamic>> jsonData =
      daftarHabit.map((habit) => habit.toJson()).toList();

  String jsonString = JsonEncoder.withIndent('  ').convert(jsonData);

  print(jsonString);

  // =====================================================
  // JSON → OBJECT KEMBALI
  // =====================================================
  print("\n=== JSON KEMBALI KE OBJECT ===");

  // Decode string JSON menjadi List<dynamic>
  List<dynamic> decodedJson = jsonDecode(jsonString);

  // Convert kembali menjadi List<Habit>
  List<Habit> habitDariJson =
      decodedJson.map((json) => Habit.fromJson(json)).toList();

  // Tampilkan hasil object baru
  for (var habit in habitDariJson) {
    print("\nHabit: ${habit.nama}");
    for (var record in habit.records) {
      print(
          "Tanggal: ${record.tanggal} | Status: ${record.isSelesai ? "Selesai" : "Belum"}");
    }
  }
}
