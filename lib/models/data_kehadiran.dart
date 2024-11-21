import 'package:absen_mahasiswa3/models/mahasiswa.dart';

class DataKehadiran {
  final DateTime tanggal;
  final int hitungHadir;
  final int hitungAbsen;
  final List<Mahasiswa> salin;

  DataKehadiran(
      {required this.tanggal,
      required this.hitungHadir,
      required this.hitungAbsen,
      required this.salin,
      });
}
