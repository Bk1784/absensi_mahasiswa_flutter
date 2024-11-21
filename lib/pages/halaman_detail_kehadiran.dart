import 'package:absen_mahasiswa3/models/mahasiswa.dart';
import 'package:flutter/material.dart';

class HalamanDetailKehadiran extends StatelessWidget {
  final String tanggal;
  final List<Mahasiswa> hadir;
  final List<Mahasiswa> absen;

  const HalamanDetailKehadiran({
    Key? key,
    required this.tanggal,
    required this.hadir,
    required this.absen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed:(){
         Navigator.pop(context);}, 
         icon: Icon(Icons.arrow_back, color: Colors.white,)),
        backgroundColor: Colors.blueAccent,
        title: Text(style: TextStyle(color: Colors.white), "Detail kehadiran"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tanggal: $tanggal",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Mahasiswa Hadir:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: hadir.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(hadir[index].name),
                  );
                }),
                const SizedBox(height: 16),
                const Text(
                  'Mahasiswa Tidak hadir:',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  )),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: absen.length,
                    itemBuilder: (context, index){
                      return ListTile(
                        title: Text(absen[index].name),
                      );
                    })
          ],
        ),
      ),
    );
  }
}
