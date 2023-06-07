import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import '../constants/color.dart';

class DetailPenggunaScreen extends StatefulWidget {
  final String userID;
  const DetailPenggunaScreen({Key? key, required this.userID})
      : super(key: key);

  @override
  State<DetailPenggunaScreen> createState() => _DetailPenggunaScreenState();
}

class _DetailPenggunaScreenState extends State<DetailPenggunaScreen> {
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
    var url = Uri.parse('http://192.168.100.7:8000/api/admin/user/${widget.userID}');
    var response = await http.get(url);

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
          'Detail Pengguna',
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
