import 'dart:convert';

import 'package:calmind_admin/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../screens/detail_laporan_mitra_screen.dart';

class LaporanMitraWidget extends StatefulWidget {
  const LaporanMitraWidget({super.key});

  @override
  State<LaporanMitraWidget> createState() => _LaporanMitraWidgetState();
}

class _LaporanMitraWidgetState extends State<LaporanMitraWidget> {
  List<dynamic> laporans = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> fetchData() async {
    var url = Uri.parse('http://192.168.100.7:8000/api/admin/laporan/');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      setState(() {
        laporans = jsonResponse['body'];
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
            "Data Laporan Mitra",
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
                itemCount: laporans.length,
                itemBuilder: (context, index) {
                  final laporan = laporans[index];
                  if (laporan['mitra_id'] == null) {
                    // Jika status transaksi bukan 'Diproses', maka tidak membuat Card
                    return SizedBox();
                  } else {
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
                              builder: (context) => DetailLaporanMitraScreen(
                                laporanID: laporan['id'].toString(),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: ListTile(
                            title: Text(
                              laporan['mitra']['first_name'].toString(),
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
                              laporan['description'],
                              style: TextStyle(fontSize: 14),
                              overflow: TextOverflow
                                  .ellipsis, // Menyembunyikan teks yang melampaui batas
                              maxLines: 1,
                            ),
                            trailing: Text(
                              'Lihat Detail',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              )),
        ),
      ],
    );
  }
}
