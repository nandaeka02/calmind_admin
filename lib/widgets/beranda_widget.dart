import 'dart:async';
import 'dart:math';

import 'package:calmind_admin/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_charts/flutter_charts.dart' as charts;
import 'package:syncfusion_flutter_charts/charts.dart';

class CpuUsage {
  final DateTime time;
  final double usage;

  CpuUsage(this.time, this.usage);
}

class BerandaWidget extends StatefulWidget {
  const BerandaWidget({super.key});

  @override
  State<BerandaWidget> createState() => _BerandaWidgetState();
}

class _BerandaWidgetState extends State<BerandaWidget> {
  List<CpuUsage> cpuData = [];
  Timer? timer;
  void startDataUpdates() {
    // Memulai pembaruan data dengan interval 2 detik
    timer = Timer.periodic(Duration(seconds: 2), (Timer timer) {
      final cpuUsage = CpuUsage(DateTime.now(), getCurrentCpuUsage());
      setState(() {
        cpuData.add(cpuUsage);
      });
      // Memeriksa waktu data terbaru
      final currentTime = DateTime.now();
      final DateTime oneMinuteAgo = currentTime.subtract(Duration(minutes: 2));

      // Menghapus data yang lebih lama dari 1 menit yang lalu
      cpuData.removeWhere((usage) => usage.time.isBefore(oneMinuteAgo));
    });
  }

  @override
  void dispose() {
    stopDataUpdates();
    super.dispose();
  }

  void stopDataUpdates() {
    // Menghentikan pembaruan data
    timer?.cancel();
  }

  @override
  void initState() {
    startDataUpdates();
    super.initState();
  }

  double getCurrentCpuUsage() {
    return double.parse(
        (0.0 + (100.0 - 0.0) * Random().nextDouble()).toStringAsFixed(2));
  }

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
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
                    ))),
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
                  // Expanded(
                  // child:

                  Card(
                    margin: EdgeInsets.only(left: 0, bottom: 16),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(8, 16, 16, 8),
                      height: 250.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Center(
                            child: Text(
                              'CPU Usage',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Expanded(
                            child: SfCartesianChart(
                              primaryXAxis: DateTimeAxis(
                                minimum: now.subtract(Duration(minutes: 1)),
                                maximum: now,
                              ),
                              primaryYAxis: NumericAxis(
                                minimum: 0, // Nilai minimum pada sumbu Y
                                maximum: 100, // Nilai maksimum pada sumbu Y
                              ),
                              series: <ChartSeries>[
                                LineSeries<CpuUsage, DateTime>(
                                  dataSource: cpuData,
                                  xValueMapper: (CpuUsage usage, _) =>
                                      usage.time,
                                  yValueMapper: (CpuUsage usage, _) =>
                                      usage.usage,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // ),

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

// class DateTimeHelper {
//   static DateTime now() => DateTime.now();
// }
