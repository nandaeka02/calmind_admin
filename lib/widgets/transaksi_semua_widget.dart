import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../screens/detail_transaksi_screen.dart';

class TransaksiSemuaWidget extends StatelessWidget {
  const TransaksiSemuaWidget({super.key});

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
            GestureDetector(
              child: Card(
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
                    trailing: Text(
                      'Berhasil',
                      style: TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold),
                    )),
              ),
              onTap: (){
                Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => DetailTransaksiScreen(userID: '123',)),
                    );
              },
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
                  trailing: Text(
                    'Berhasil',
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
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
                  trailing: Text(
                    'Dibatalkan',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
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
