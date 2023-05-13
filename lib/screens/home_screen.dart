import 'package:calmind_admin/constants/color.dart';
import 'package:flutter/material.dart';
import '../widgets/beranda_widget.dart';
import '../widgets/kelola_widget.dart';
import '../widgets/laporan_widget.dart';
import '../widgets/transaksi_widget.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({super.key});
  final String nPass, nUsername;
  const HomeScreen({
    Key? key,
    required this.nPass,
    required this.nUsername,
  }) : super(key: key);
  // PageBerandaUtama({required this.nPass, required this.nUsername});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.tertiaryColor20,
      appBar: AppBar(
          backgroundColor: Constants.primaryColor,
          elevation: 0,
          title: Center(
            child: Text(_selectedIndex == 0
                ? 'Beranda'
                : _selectedIndex == 1
                    ? 'Kelola'
                    : _selectedIndex == 2
                        ? 'Transaksi'
                        : 'Laporan'),
          )),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          BerandaWidget(),
          KelolaWidget(),
          TransaksiWidget(),
          LaporanWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Constants.secondaryColor,
        unselectedItemColor: Constants.tertiaryColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts_rounded),
            label: 'Kelola',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_snippet_rounded),
            label: 'Transaksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sms_failed_rounded),
            label: 'Laporan',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
