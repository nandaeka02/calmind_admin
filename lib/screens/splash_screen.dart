import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:calmind_admin/screens/login_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    // Menjalankan timer selama 3 detik untuk berpindah ke halaman berikutnya
    Timer(Duration(seconds: 3), () {
      
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Splash-Screen-Background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              Positioned(
                top: 0.0,
                left: 0.0,
                child: SvgPicture.asset(
                  'assets/images/Splash-Screen-Lines.svg',
                  width: 400.0,
                  height: 400.0,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Center(
                  child: Image.asset(
                    'assets/images/Logo-Calmind-3.png', 
                    width: 300.0,
                    height: 300.0,
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()..scale(-1.0, -1.0, 1.0),
                  child: SvgPicture.asset(
                    'assets/images/Splash-Screen-Lines.svg',
                    width: 400.0,
                    height: 400.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
