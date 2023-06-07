import 'dart:convert';

import 'package:calmind_admin/constants/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import '../screens/detail_mitra_screen.dart';
import '../screens/verifikasi_mitra_screen.dart';

class KelolaMitraWidget extends StatefulWidget {
  const KelolaMitraWidget({super.key});

  @override
  State<KelolaMitraWidget> createState() => _KelolaMitraWidgetState();
}

class _KelolaMitraWidgetState extends State<KelolaMitraWidget> {
  TextEditingController editingController = TextEditingController();
  List<dynamic> users = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    var url = Uri.parse('http://192.168.100.7:8000/api/admin/mitra/');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      setState(() {
        users = jsonResponse['body'];
      });
    } else {
      print('Error: ${response.statusCode}');
    }
  }

  Future<List<dynamic>> getAllUsers() async {
    var url = Uri.parse('http://192.168.100.7:8000/api/admin/mitra/');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      return jsonResponse['body'];
    } else {
      throw Exception('Failed to fetch data');
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
            "Data Mitra Psikolog Calmind",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 3), // mengatur offset bayangan (x, y)
              ),
            ],
          ),
          child: TextField(
            onChanged: searchDataWarga,
            controller: editingController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                fillColor: Colors.white,
                filled: true,
                hintText: "Search",
                suffixIcon: Icon(Icons.search),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(10.0)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0))),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        Expanded(
            child: RefreshIndicator(
                onRefresh: refreshData,
                child: ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];
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
                                builder: (context) => DetailMitraScreen(
                                      mitraID: user['id'].toString(),
                                    )),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          // height: 58,
                          child: ListTile(
                            title: Text(
                              user['first_name'] ?? 'Unknown',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            leading: Icon(Icons.person),
                            subtitle: Text(
                              'Bojong Gede Blok TD 6 No 5A RT 002 RW 012',
                              style: TextStyle(fontSize: 12),
                            ),
                            trailing: Text("Lihat Detail"),
                          ),
                        ),
                      ),
                    );
                  },
                ))),
      ],
    );
  }

  Future<void> searchDataWarga(String query) async {
    final allUsers = await getAllUsers();
    final suggestions = allUsers.where((data) {
      print(data);
      final namaDataWarga =
          data['first_name'] != null ? data['first_name'].toLowerCase() : '';
      final input = query.toLowerCase();

      return namaDataWarga.contains(input);
    }).toList();

    setState(() => users = suggestions);
  }
}
