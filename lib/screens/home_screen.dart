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
  
  // int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // static List<Widget> _widgetOptions = <Widget>[
  //   // ListView.builder(
  //   //   itemCount: 10,
  //   //   itemBuilder: (BuildContext context, int index) {
  //   //     return PostWidget(
  //   //       title: 'Post ${index + 1}',
  //   //       subtitle: 'This is post number ${index + 1}',
  //   //     );
  //   //   },
  //   // ),
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: Business',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: School',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 3: School',
  //     style: optionStyle,
  //   ),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          BerandaWidget(),
          KelolaWidget(),
          TransaksiWidget(),
          LaporanWidget(),
        ],
      ),
      // body: Center(
      //   child: _widgetOptions.elementAt(_selectedIndex)
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Beranda',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.business),
      //       label: 'Kelola',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.school),
      //       label: 'Transaksi',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.school),
      //       label: 'Laporan',
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.blue[800],
      //   onTap: _onItemTapped,
      // ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Menu 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Menu 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Menu 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Menu 4',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}