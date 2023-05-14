import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/color.dart';

class DetailMitraScreen extends StatefulWidget {
  final String userID;
  const DetailMitraScreen({Key? key, required this.userID})
      : super(key: key);

  @override
  State<DetailMitraScreen> createState() => _DetailMitraScreenState();
}

class _DetailMitraScreenState extends State<DetailMitraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Detail Mitra',
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
      body: Center(
        child: Text('Detail Mitra'),
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
                child: Text('Simpan'),
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
                child: Text('Batal'),
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