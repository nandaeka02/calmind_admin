import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class KelolaMitraWidget extends StatelessWidget {
  const KelolaMitraWidget ({super.key});

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
                title: Text('Dr. Rina Setiawan'),
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
                title: Text('Dr. Hadiwijaya Prasetyo'),
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
                title: Text('Dr. Maya Kusuma'),
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
                  'Data Seluruh Mitra',
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
                title: Text('Dr. Agus Suryanto'),
                subtitle: Text('Menunggu verifikasi KTP'),
                trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_outward)),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Card(
              margin: EdgeInsets.only(right: 0, left: 0),
              child: ListTile(
                // leading: Icon(Icons.person),
                title: Text('Dr. Rini Wulandari'),
                subtitle: Text('Menunggu verifikasi KTP'),
                trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_outward)),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Card(
              margin: EdgeInsets.only(right: 0, left: 0),
              child: ListTile(
                // leading: Icon(Icons.person),
                title: Text('Dr. Dian Purnomo'),
                subtitle: Text('Menunggu verifikasi KTP'),
                trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_outward)),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Card(
              margin: EdgeInsets.only(right: 0, left: 0),
              child: ListTile(
                // leading: Icon(Icons.person),
                title: Text('Dr. Rizky Indahsari'),
                subtitle: Text('Menunggu verifikasi KTP'),
                trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_outward)),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Card(
              margin: EdgeInsets.only(right: 0, left: 0),
              child: ListTile(
                // leading: Icon(Icons.person),
                title: Text('Dr. Andi Hermawan'),
                subtitle: Text('Menunggu verifikasi KTP'),
                trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_outward)),
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