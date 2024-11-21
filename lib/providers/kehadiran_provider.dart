import 'package:absen_mahasiswa3/models/data_kehadiran.dart';
import 'package:absen_mahasiswa3/models/mahasiswa.dart';
import 'package:flutter/material.dart';

class KehadiranProvider extends ChangeNotifier {
  final List<Mahasiswa> _mahasiswas = [
    Mahasiswa(name: 'Lili Maulida'),
    Mahasiswa(name: 'Juvita Elifatu Rizka'),
    Mahasiswa(name: 'Desi Fitryani'),
    Mahasiswa(name: 'Dhiza Chalvillia Maharani Triyana'),
    Mahasiswa(name: 'Nadieana Valianti'),
    Mahasiswa(name: 'Mutia Rizki'),
    Mahasiswa(name: 'Wahyu Khoirur Rokhima'),
    Mahasiswa(name: 'Tyani'),
    Mahasiswa(name: 'Elsa'),
  ];

  List<Mahasiswa> get mahasiswas => _mahasiswas;

  final List<DataKehadiran> _history = [];
  List<DataKehadiran> get history => _history;

  void simpanKehadiran() {
    int hitungHadir =
        _mahasiswas.where((mahasiswa) => mahasiswa.isPresent).length;
    int hitungAbsen = _mahasiswas.length - hitungHadir;

    final salin = _mahasiswas.map((mahasiswa) {
      return Mahasiswa(name: mahasiswa.name, isPresent: mahasiswa.isPresent);
    }).toList();

    _history.insert(
      0,
      DataKehadiran(
          tanggal: DateTime.now(),
          hitungHadir: hitungHadir,
          hitungAbsen: hitungAbsen,
          salin: salin),
    );
    for (var mahasiswa in _mahasiswas) {
      mahasiswa.isPresent = false;
    }
    notifyListeners();
  }

  void tandaHadir(int index, bool value) {
    _mahasiswas[index].isPresent = value;
    notifyListeners();
  }
}
