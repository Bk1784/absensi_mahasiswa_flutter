import 'package:absen_mahasiswa3/pages/halaman_detail_kehadiran.dart';
import 'package:absen_mahasiswa3/providers/kehadiran_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HalamanHistory extends StatelessWidget {
  const HalamanHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final history = Provider.of<KehadiranProvider>(context).history;
    final kehadiranProvider = Provider.of<KehadiranProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(style: TextStyle(color: Colors.white),'Riwayat Kehadiran'),
      ),
      body: kehadiranProvider.history.isEmpty
          ? const Center(child: Text('tidak ada riwayat kehadiran'))
          : ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                final record = history[index];
                final formatTanggal =
                    DateFormat('EEEE, dd MMMM yyyy').format(record.tanggal);
                return ListTile(
                  title: Text(
                    "Tanggal: $formatTanggal",
                  ),
                  subtitle: Text(
                    'Hadir: ${record.hitungHadir}, Tidak Hadir: ${record.hitungAbsen}',
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HalamanDetailKehadiran(
                                tanggal: formatTanggal,
                                hadir: record.salin.where((mahasiswa) => mahasiswa.isPresent).toList(),
                                absen: record.salin.where((mahasiswa) => !mahasiswa.isPresent).toList())));
                  },
                );
              }),
    );
  }
}
