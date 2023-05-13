import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

class LaporanPenggunaWidget extends StatelessWidget {
  const LaporanPenggunaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            SizedBox(
              height: 24,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Semua Laporan Pengguna',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )),
            SizedBox(
              height: 16,
            ),
            Card(
              margin: EdgeInsets.only(right: 0, left: 0),
              child: ListTile(
                  title: Text('Tidak Bisa Login'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '20 Maret 2023',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Rosa Aulia',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  trailing: Text(
                    'Detail',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: 16,
            ),
            Card(
              margin: EdgeInsets.only(right: 0, left: 0),
              child: ListTile(
                  title: Text('Tidak Bisa Melakukan Transaksi'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '19 Maret 2023',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Muhammad Alif Nur Afrizal',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  trailing: Text(
                    'Detail',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: 16,
            ),
            Card(
              margin: EdgeInsets.only(right: 0, left: 0),
              child: ListTile(
                  title: Text('Gangguan Konseling Online'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '8 Maret 2023',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Alamsyah Dwi Putra',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  trailing: Text(
                    'Detail',
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ],
    );
  }
}
