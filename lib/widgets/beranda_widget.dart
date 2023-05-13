import 'package:calmind_admin/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BerandaWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  color: ConstantColors.primaryColor,
                  // decoration: BoxDecoration(color: Colors.blue),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        right: -40,
                        child: SvgPicture.asset(
                          'assets/images/Logo-Calmind.svg',
                          height: 200,
                        ),
                      ),
                    ],
                  )
                )),
            Padding(
              padding: EdgeInsets.only(right: 32, left: 32, bottom: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Hallo Admin',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.normal,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Card(
                          margin:
                              EdgeInsets.only(right: 8, left: 0, bottom: 16),
                          child: Container(
                            height: 200.0,
                            child: Text('Card 1'),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Card(
                          margin:
                              EdgeInsets.only(right: 0, left: 8, bottom: 16),
                          child: Container(
                            height: 200.0,
                            child: Text('Card 2'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Card(
                    margin: EdgeInsets.only(right: 0, left: 0),
                    child: ListTile(
                      leading: Icon(Icons.warning),
                      title: Text('Laporan Masalah'),
                      subtitle: Text('Periksa Laporan Masalah'),
                      trailing: Icon(Icons.arrow_outward),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Status Server',
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
                        title: Text('Server Database'),
                        trailing: Container(
                          width: 16, // Menentukan lebar circle
                          height: 16, // Menentukan tinggi circle
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green, // Warna background circle
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Card(
                    margin: EdgeInsets.only(right: 0, left: 0),
                    child: ListTile(
                        title: Text('Server Website'),
                        trailing: Container(
                          width: 16, // Menentukan lebar circle
                          height: 16, // Menentukan tinggi circle
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green, // Warna background circle
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Card(
                    margin: EdgeInsets.only(right: 0, left: 0),
                    child: ListTile(
                      title: Text('Layanan Call Centre'),
                      trailing: Container(
                        width: 16, // Menentukan lebar circle
                        height: 16, // Menentukan tinggi circle
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green, // Warna background circle
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
                        title: Text('Layanan API'),
                        trailing: Container(
                          width: 16, // Menentukan lebar circle
                          height: 16, // Menentukan tinggi circle
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green, // Warna background circle
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
