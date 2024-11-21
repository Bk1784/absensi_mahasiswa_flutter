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
        title: const Text(
            style: TextStyle(color: Colors.white), 'Pencatatan Kehadiran'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: mahasiswas.length,
              itemBuilder: (context, index) {
                final mahasiswa = mahasiswas[index];
                return Card(
                  elevation: 3,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    title: Text(
                      mahasiswa.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    trailing: Checkbox(
                      activeColor: Colors.blueAccent,
                        value: mahasiswa.isPresent,
                        onChanged: (hasil) {
                          mahasiswa.isPresent = hasil ?? false;
                          kehadiranProvider.notifyListeners();
                        }),
                  ),
                );
              },
            ),
          ),
        ],
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
          style: ElevatedButton.styleFrom(foregroundColor: Colors.blueAccent),
          child: const Text('Simpan Kehadiran'),
        ),
      ),
    );
  }
}
