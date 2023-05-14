import 'package:calmind_admin/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../screens/masalah_transaksi_screen.dart';

class TransaksiMasalahWidget extends StatelessWidget {
  const TransaksiMasalahWidget({super.key});

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
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => MasalahTransaksiScreen(
                                  userID: '123',
                                )),
                      );
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Tindak',
                        ),
                        TextSpan(
                            text:
                                '\n'), // Tambahkan karakter baris baru (\n) di antara kata-kata
                        TextSpan(
                          text: 'Lanjuti',
                        ),
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: ConstantColors
                        .secondaryColor, // Ganti warna sesuai keinginan Anda
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
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Tindak',
                        ),
                        TextSpan(
                            text:
                                '\n'), // Tambahkan karakter baris baru (\n) di antara kata-kata
                        TextSpan(
                          text: 'Lanjuti',
                        ),
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: ConstantColors
                        .secondaryColor, // Ganti warna sesuai keinginan Anda
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
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Tindak',
                        ),
                        TextSpan(
                            text:
                                '\n'), // Tambahkan karakter baris baru (\n) di antara kata-kata
                        TextSpan(
                          text: 'Lanjuti',
                        ),
                      ],
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: ConstantColors
                        .secondaryColor, // Ganti warna sesuai keinginan Anda
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
