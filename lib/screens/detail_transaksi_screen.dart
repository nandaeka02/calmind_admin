import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import '../constants/color.dart';
import 'package:intl/intl.dart';

class DetailTransaksiScreen extends StatefulWidget {
  final String transaksiID;
  const DetailTransaksiScreen({Key? key, required this.transaksiID})
      : super(key: key);

  @override
  State<DetailTransaksiScreen> createState() => _DetailTransaksiScreenState();
}

class _DetailTransaksiScreenState extends State<DetailTransaksiScreen> {
  Map<String, dynamic>? dataTransaksi;
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
        'http://192.168.100.7:8000/api/admin/transaksi/${widget.transaksiID}');
    var response = await http.get(url);

    print(url);

    if (response.statusCode == 200) {
      print("berhasil");

      var jsonResponse = json.decode(response.body);
      setState(() {
        dataTransaksi = jsonResponse['body'];
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
          'Detail Transaksi',
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
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Nomor Transaksi",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          ": " + (dataTransaksi?['id']).toString(),
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
                          "Tanggal Transaksi",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          ": " +
                              ((dataTransaksi?['created_at'] != null)
                                  ? DateFormat('dd MMMM yyyy').format(
                                      DateTime.parse(
                                          (dataTransaksi?['created_at'])
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
                    children: [
                      Expanded(
                        child: Text(
                          "Dari",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          ": " +
                              (dataTransaksi?['user']['first_name']).toString(),
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
                    children: [
                      Expanded(
                        child: Text(
                          "Ke",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          ": " +
                              (dataTransaksi?['mitra']['first_name'])
                                  .toString(),
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
                    children: [
                      Expanded(
                        child: Text(
                          "Platform",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          ": " + (dataTransaksi?['platform']).toString(),
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
                    children: [
                      Expanded(
                        child: Text(
                          "Status",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          ": " + (dataTransaksi?['status']).toString(),
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
                    children: [
                      Expanded(
                        child: Text(
                          "Total biaya",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          ": " +
                              ((dataTransaksi?['total'] != null)
                                  ? currencyFormat.format(double.parse(
                                      (dataTransaksi?['total']).toString()))
                                  : "N/A"), // Tampilkan "N/A" jika null
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
    );
  }
}
