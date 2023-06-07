import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import '../constants/color.dart';

class DetailMitraScreen extends StatefulWidget {
  final String mitraID;
  const DetailMitraScreen({Key? key, required this.mitraID})
      : super(key: key);

  @override
  State<DetailMitraScreen> createState() => _DetailMitraScreenState();
}

class _DetailMitraScreenState extends State<DetailMitraScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController degreeController = TextEditingController();
  TextEditingController lincenseNumberController = TextEditingController();
  Map<String, dynamic>? dataUser;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
    
  }

  @override
  void dispose() {
    // Menghapus TextEditingController saat tidak lagi digunakan
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneNumberController.dispose();
    addressController.dispose();
    countryController.dispose();
    cityController.dispose();
    postalCodeController.dispose();
    birthdateController.dispose();
    genderController.dispose();
    super.dispose();
  }

  Future<void> fetchData() async {
    var url = Uri.parse('http://192.168.100.7:8000/api/admin/mitra/${widget.mitraID}');
    var response = await http.get(url);

    print(url);

    if (response.statusCode == 200) {
      print("berhasil");

      var jsonResponse = json.decode(response.body);
      setState(() {
        dataUser = jsonResponse['body'];
      });
    } else {

      print('Error: ${response.statusCode}');
    }
    firstNameController.text = dataUser?['first_name'] ?? '-';
    lastNameController.text = dataUser?['last_name'] ?? '-';
    emailController.text = dataUser?['email'] ?? '-';
    passwordController.text = dataUser?['password'] ?? '-';
    phoneNumberController.text = dataUser?['phone_number'] ?? '-';
    addressController.text = dataUser?['address'] ?? '-';
    countryController.text = dataUser?['country'] ?? '-';
    cityController.text = dataUser?['city'] ?? '-';
    postalCodeController.text = dataUser?['postal_code'] ?? '-';
    birthdateController.text = dataUser?['birthdate'] ?? '-';
    genderController.text = dataUser?['gender'] ?? '-';
    degreeController.text = dataUser?['degree'] ?? '-';
    lincenseNumberController.text = dataUser?['lincense_number'] ?? '-';
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
          'Detail Mitra Psikolog',
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
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : 
        ListView(
          children: [
            Text(
              "Indentitas",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Nama Depan',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 4,
            ),
            TextField(
              controller: firstNameController,
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Nama Belakang',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 4,
            ),
            TextField(
              controller: lastNameController,
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Email',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 4,
            ),
            TextField(
              controller: emailController,
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Password',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 4,
            ),
            TextField(
              controller: passwordController,
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Nomor Telepon',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 4,
            ),
            TextField(
              controller: phoneNumberController,
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Alamat',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 4,
            ),
            TextField(
              controller: addressController,
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Negara',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 4,
            ),
            TextField(
              controller: countryController,
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Kota',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 4,
            ),
            TextField(
              controller: cityController,
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Kode Pos',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 4,
            ),
            TextField(
              controller: postalCodeController,
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Tanggal Lahir',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 4,
            ),
            TextField(
              controller: birthdateController,
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Jenis Kelamin',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 4,
            ),
            TextField(
              controller: genderController,
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Gelar',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 4,
            ),
            TextField(
              controller: degreeController,
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Nomor Izin Praktek',
              style: TextStyle(fontSize: 14),
            ),
            SizedBox(
              height: 4,
            ),
            TextField(
              controller: lincenseNumberController,
              style: TextStyle(fontSize: 14),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              ),
            ),
            SizedBox(
              height: 12,
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