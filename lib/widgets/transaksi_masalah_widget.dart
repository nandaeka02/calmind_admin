import 'dart:convert';

import 'package:calmind_admin/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import '../screens/masalah_transaksi_screen.dart';

class TransaksiMasalahWidget extends StatefulWidget {
  const TransaksiMasalahWidget({super.key});

  @override
  State<TransaksiMasalahWidget> createState() => _TransaksiMasalahWidgetState();
}

class _TransaksiMasalahWidgetState extends State<TransaksiMasalahWidget> {
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
            "Semua Transaksi",
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
                    if (transaksi['status'] == 'Gagal') {
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
                                builder: (context) => MasalahTransaksiScreen(
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
                                  color: Colors.red,
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

// class TransaksiMasalahWidget extends StatelessWidget {
//   const TransaksiMasalahWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       children: [
//         Column(
//           children: [
//             SizedBox(
//               height: 24,
//             ),
//             Align(
//                 alignment: Alignment.topLeft,
//                 child: Text(
//                   'Semua Transaksi',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 )),
//             SizedBox(
//               height: 16,
//             ),
//             Card(
//               margin: EdgeInsets.only(right: 0, left: 0),
//               child: ListTile(
//                 title: Text('098293810'),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Dr. Frans Noto to Joko Budi',
//                       style: TextStyle(fontSize: 12),
//                     ),
//                     Text(
//                       'Biaya konseling online via Bank',
//                       style: TextStyle(fontSize: 12),
//                     )
//                   ],
//                 ),
//                 trailing: ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).push(
//                         MaterialPageRoute(
//                             builder: (_) => MasalahTransaksiScreen(
//                                   userID: '123',
//                                 )),
//                       );
//                   },
//                   child: RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: 'Tindak',
//                         ),
//                         TextSpan(
//                             text:
//                                 '\n'), // Tambahkan karakter baris baru (\n) di antara kata-kata
//                         TextSpan(
//                           text: 'Lanjuti',
//                         ),
//                       ],
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: ConstantColors
//                         .secondaryColor, // Ganti warna sesuai keinginan Anda
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 16,
//             ),
//             Card(
//               margin: EdgeInsets.only(right: 0, left: 0),
//               child: ListTile(
//                 title: Text('098293810'),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Dr. Frans Noto to Joko Budi',
//                       style: TextStyle(fontSize: 12),
//                     ),
//                     Text(
//                       'Biaya konseling online via Bank',
//                       style: TextStyle(fontSize: 12),
//                     )
//                   ],
//                 ),
//                 trailing: ElevatedButton(
//                   onPressed: () {},
//                   child: RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: 'Tindak',
//                         ),
//                         TextSpan(
//                             text:
//                                 '\n'), // Tambahkan karakter baris baru (\n) di antara kata-kata
//                         TextSpan(
//                           text: 'Lanjuti',
//                         ),
//                       ],
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: ConstantColors
//                         .secondaryColor, // Ganti warna sesuai keinginan Anda
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 16,
//             ),
//             Card(
//               margin: EdgeInsets.only(right: 0, left: 0),
//               child: ListTile(
//                 title: Text('098293810'),
//                 subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Dr. Frans Noto to Joko Budi',
//                       style: TextStyle(fontSize: 12),
//                     ),
//                     Text(
//                       'Biaya konseling online via Bank',
//                       style: TextStyle(fontSize: 12),
//                     )
//                   ],
//                 ),
//                 trailing: ElevatedButton(
//                   onPressed: () {},
//                   child: RichText(
//                     text: TextSpan(
//                       children: [
//                         TextSpan(
//                           text: 'Tindak',
//                         ),
//                         TextSpan(
//                             text:
//                                 '\n'), // Tambahkan karakter baris baru (\n) di antara kata-kata
//                         TextSpan(
//                           text: 'Lanjuti',
//                         ),
//                       ],
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     primary: ConstantColors
//                         .secondaryColor, // Ganti warna sesuai keinginan Anda
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 16,
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
