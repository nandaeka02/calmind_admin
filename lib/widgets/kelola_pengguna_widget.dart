import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../screens/detail_pengguna_screen.dart';
import '../screens/verifikasi_pengguna_screen.dart';

class KelolaPenggunaWidget extends StatelessWidget {
  const KelolaPenggunaWidget({super.key});

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
                  'Menunggu Verifikasi',
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
                // leading: Icon(Icons.person),
                title: Text('Fransnoto'),
                subtitle: Text('Menunggu verifikasi KTP'),
                trailing: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (_) => VerifikasiPenggunaScreen(
                                userID: '123',
                              )),
                    );
                  },
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
                // leading: Icon(Icons.person),
                title: Text('Budi Joko'),
                subtitle: Text('Menunggu verifikasi KTP'),
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
                // leading: Icon(Icons.person),
                title: Text('Siti Nur Baya'),
                subtitle: Text('Menunggu verifikasi KTP'),
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
              height: 24,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Data Seluruh Pengguna',
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
                // leading: Icon(Icons.person),
                title: Text('Budi Santoso'),
                subtitle: Text('Menunggu verifikasi KTP'),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => DetailPenggunaScreen(
                                  userID: '123',
                                )),
                      );
                    },
                    icon: Icon(Icons.arrow_outward)),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Card(
              margin: EdgeInsets.only(right: 0, left: 0),
              child: ListTile(
                // leading: Icon(Icons.person),
                title: Text('Siti Rahayu'),
                subtitle: Text('Menunggu verifikasi KTP'),
                trailing: IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_outward)),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Card(
              margin: EdgeInsets.only(right: 0, left: 0),
              child: ListTile(
                // leading: Icon(Icons.person),
                title: Text('Ahmad Pratama'),
                subtitle: Text('Menunggu verifikasi KTP'),
                trailing: IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_outward)),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Card(
              margin: EdgeInsets.only(right: 0, left: 0),
              child: ListTile(
                // leading: Icon(Icons.person),
                title: Text('Dewi Utami'),
                subtitle: Text('Menunggu verifikasi KTP'),
                trailing: IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_outward)),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Card(
              margin: EdgeInsets.only(right: 0, left: 0),
              child: ListTile(
                // leading: Icon(Icons.person),
                title: Text('Joko Susanto'),
                subtitle: Text('Menunggu verifikasi KTP'),
                trailing: IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_outward)),
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
