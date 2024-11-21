import 'package:absen_mahasiswa3/models/mahasiswa.dart';
import 'package:flutter/material.dart';

class MahasiswaListItem extends StatefulWidget {
  final Mahasiswa mahasiswa;

  const MahasiswaListItem({super.key, required this.mahasiswa});

  @override
  State<MahasiswaListItem> createState() => _MahasiswaListItemState();
}

class _MahasiswaListItemState extends State<MahasiswaListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.mahasiswa.name),
      trailing: Checkbox(
        activeColor: Colors.blueAccent,
          value: widget.mahasiswa.isPresent,
          onChanged: (value) {
            setState(() {
              widget.mahasiswa.isPresent = value ?? false;
            });
            
          }),
    );
  }
}
