import 'package:calmind_admin/widgets/laporan_mitra_widget.dart';
import 'package:calmind_admin/widgets/laporan_pengguna_widget.dart';
import 'package:flutter/material.dart';

class LaporanWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Padding(
          padding: EdgeInsets.only(right: 16, left: 16, top: 16),
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 16, left: 16),
                  height: kToolbarHeight - 8.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: TabBar(
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 4.0,
                            spreadRadius: 1.5,
                            offset: Offset(0, 1),
                          ),
                        ],
                        color: Colors.white),

                    tabs: [
                      Tab(
                        child: Text(
                          'Pengguna',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Mitra',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                    labelColor: Colors.black, // Warna teks tab aktif
                    unselectedLabelColor: Colors.grey,
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      Container(
                        child: LaporanPenggunaWidget(),
                        margin: EdgeInsets.only(right: 16, left: 16),
                      ),
                      Container(
                        child: LaporanMitraWidget(),
                        margin: EdgeInsets.only(right: 16, left: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}