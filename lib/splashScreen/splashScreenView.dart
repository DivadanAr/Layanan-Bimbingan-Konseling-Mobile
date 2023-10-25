// ignore_for_file: deprecated_member_use

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:layananbk_flutter/splashScreen/animationView.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      MaterialPageRoute(builder: (context) => IntroductionAnimationScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              // Lottie.network(
              //   'assets/loading.json',
              //   width: 400,
              //   height: 400,
              // ),

            SizedBox(height: 10),
            TyperAnimatedTextKit(
              text: ['Starbhak Konseling'],
              textStyle: GoogleFonts.quicksand(
                textStyle: TextStyle(
                  color: Color(0xffBA94D1),
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
              speed: Duration(milliseconds: 140),
              isRepeatingAnimation: true,
            )
          ],
        ),
      ),
    );
  }
}
