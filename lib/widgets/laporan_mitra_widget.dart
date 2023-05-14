import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';

import '../screens/detail_laporan_mitra_screen.dart';

class LaporanMitraWidget extends StatelessWidget {
  const LaporanMitraWidget({super.key});

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
            GestureDetector(
              child: Card(
                margin: EdgeInsets.only(right: 0, left: 0),
                child: ListTile(
                    title: Text('Tidak Bisa Login Mitra'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '20 Maret 2023',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          'Dr. Jekidermen',
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
              onTap: () {
                Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => DetailLaporanMitraScreen(
                                  userID: '123',
                                )),
                      );
              },
            ),
            SizedBox(
              height: 16,
            ),
            Card(
              margin: EdgeInsets.only(right: 0, left: 0),
              child: ListTile(
                  title: Text('Transaksi Masuk'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '19 Maret 2023',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Dr. Andi Hermawan',
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
                        'Dr. Dian Purnomo',
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
