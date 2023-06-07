import 'dart:convert';

import 'package:calmind_admin/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import '../screens/verifikasi_transaksi_screen.dart';

class TransaksiVerifikasiWidget extends StatefulWidget {
  const TransaksiVerifikasiWidget({super.key});

  @override
  State<TransaksiVerifikasiWidget> createState() =>
      _TransaksiVerifikasiWidgetState();
}

class _TransaksiVerifikasiWidgetState extends State<TransaksiVerifikasiWidget> {
  List<dynamic> transaksis = [];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var url = Uri.parse('http://192.168.100.7:8000/api/admin/transaksi/');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      setState(() {
        transaksis = jsonResponse['body'];
      });
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  Future<void> refreshData() async {
    await fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24,
        ),
        Center(
          child: Text(
            "Semua Transaksi Diproses",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Expanded(
            child: RefreshIndicator(
                onRefresh: refreshData,
                child: ListView.builder(
                  itemCount: transaksis.length,
                  itemBuilder: (context, index) {
                    final transaksi = transaksis[index];
                    if (transaksi['status'] == 'Diproses') {
                      return Card(
                        elevation: 4,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          splashColor: ConstantColors.primarysplashColor,
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VerifikasiTransaksiScreen(
                                  transaksiID: transaksi['id'].toString(),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: ListTile(
                              title: Text(
                                'IDR ' + transaksi['total'].toString(),
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                'Platform : ' + transaksi['platform'],
                                style: TextStyle(fontSize: 14),
                              ),
                              trailing: Text(
                                transaksi['status'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.yellow,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      // Jika status transaksi bukan 'Diproses', maka tidak membuat Card
                      return SizedBox();
                    }
                  },
                ))),
      ],
    );
  }
}
