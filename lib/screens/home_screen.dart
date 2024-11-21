import 'package:absen_mahasiswa3/pages/halaman_history.dart';
import 'package:absen_mahasiswa3/pages/halaman_kehadiran.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HalamanKehadiran(),
    const HalamanHistory(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
        items: const [
        BottomNavigationBarItem( icon: Icon( Icons.check_circle), label: 'Pencatatan'),
        BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
      ]),
    );
  }
}
