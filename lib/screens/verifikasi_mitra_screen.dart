import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../constants/color.dart';

class VerifikasiMitraScreen extends StatefulWidget {
  final String userID;
  const VerifikasiMitraScreen({Key? key, required this.userID})
      : super(key: key);

  @override
  State<VerifikasiMitraScreen> createState() => _VerifikasiMitraScreenState();
}

class _VerifikasiMitraScreenState extends State<VerifikasiMitraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Verifikasi',
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
        child: Text('Verifikasi'),
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
                child: Text('Verifikasi'),
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