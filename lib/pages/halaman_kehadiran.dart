import 'package:absen_mahasiswa3/providers/kehadiran_provider.dart';
import 'package:absen_mahasiswa3/widgets/mahasiswa_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HalamanKehadiran extends StatelessWidget {
  const HalamanKehadiran({super.key});

  @override
  Widget build(BuildContext context) {
    final kehadiranProvider = Provider.of<KehadiranProvider>(context);
    final mahasiswas = kehadiranProvider.mahasiswas;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(style: TextStyle(color: Colors.white), 'Pencatatan Kehadiran'),
      ),
      body: ListView.separated(
        itemCount: mahasiswas.length,
        itemBuilder: (context, index) {
          return MahasiswaListItem(mahasiswa: mahasiswas[index]);
        },
        separatorBuilder: (context, index) {
          return const Divider();
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: mahasiswas.isEmpty
              ? null
              : () {
                  kehadiranProvider.simpanKehadiran();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Kehadiran disimpan!')));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.blueAccent
                ),
          
          child: const Text('Simpan Kehadiran'),
        ),
      ),
    );
  }
}
