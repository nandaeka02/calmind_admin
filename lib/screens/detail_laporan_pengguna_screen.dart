import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../constants/color.dart';

class DetailLaporanPenggunaScreen extends StatefulWidget {
  final String laporanID;
  const DetailLaporanPenggunaScreen({Key? key, required this.laporanID})
      : super(key: key);

  @override
  State<DetailLaporanPenggunaScreen> createState() => _DetailLaporanPenggunaScreenState();
}

class _DetailLaporanPenggunaScreenState extends State<DetailLaporanPenggunaScreen> {
  Map<String, dynamic>? dataLaporan;
  NumberFormat currencyFormat =
      NumberFormat.currency(locale: 'id_ID', symbol: 'IDR', decimalDigits: 2);
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var url = Uri.parse(
        'http://192.168.100.7:8000/api/admin/laporan/${widget.laporanID}');
    var response = await http.get(url);

    print(url);

    if (response.statusCode == 200) {
      print("berhasil");

      var jsonResponse = json.decode(response.body);
      setState(() {
        dataLaporan = jsonResponse['body'];
      });
    } else {
      print('Error: ${response.statusCode}');
    }
    setState(() {
      isLoading = false;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Laporan Pengguna',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  Center(
                    child: Text('Identitas', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Nama Lengkap",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          ": " +
                              (dataLaporan?['user']['first_name']).toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Tanggal Laporan",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          ": " +
                              ((dataLaporan?['created_at'] != null)
                                  ? DateFormat('dd MMMM yyyy').format(
                                      DateTime.parse(
                                          (dataLaporan?['created_at'])
                                              .toString()))
                                  : "N/A"), // Tampilkan "N/A" jika null
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "Deskripsi Laporan",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          ": " + (dataLaporan?['description']).toString(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
      backgroundColor: ConstantColors.tertiaryColor20,
      bottomNavigationBar: BottomAppBar(
        padding: EdgeInsets.only(bottom: 8, top: 8),
        child: Row(
          children: [
            SizedBox(
              width: 32,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Tindaklanjuti'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        ConstantColors.primaryColor)),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Tolak'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        ConstantColors.secondaryColor)),
              ),
            ),
            SizedBox(
              width: 32,
            ),
          ],
        ),
      ),
    );
  }
}