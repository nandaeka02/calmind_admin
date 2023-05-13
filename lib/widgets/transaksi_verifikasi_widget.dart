import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TransaksiVerifikasiWidget extends StatelessWidget {
  const TransaksiVerifikasiWidget({super.key});

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
                  'Semua Transaksi',
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
                  title: Text('098293810'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. Frans Noto to Joko Budi',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        'Biaya konseling online via Bank',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {},
                    child: Text('Verifikasi'),
                    style: ElevatedButton.styleFrom(
                      primary:
                          Colors.green, // Ganti warna sesuai keinginan Anda
                    ),
                  )),
            ),
            SizedBox(
              height: 16,
            ),
            Card(
              margin: EdgeInsets.only(right: 0, left: 0),
              child: ListTile(
                title: Text('098293810'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Frans Noto to Joko Budi',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'Biaya konseling online via Bank',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                trailing: ElevatedButton(
                  onPressed: () {},
                  child: Text('Verifikasi'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Ganti warna sesuai keinginan Anda
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Card(
              margin: EdgeInsets.only(right: 0, left: 0),
              child: ListTile(
                title: Text('098293810'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dr. Frans Noto to Joko Budi',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'Biaya konseling online via Bank',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                ),
                trailing: ElevatedButton(
                  onPressed: () {},
                  child: Text('Verifikasi'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Ganti warna sesuai keinginan Anda
                  ),
                ),
              ),
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
