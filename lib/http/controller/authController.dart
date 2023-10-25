import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:layananbk_flutter/http/api/api.dart';
import 'package:layananbk_flutter/page/controllerPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({super.key, this.nama, this.password});

  final String? nama;
  final String? password;

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  void loginUser() async {
    final data = {
      'name': widget.nama.toString(),
      'password': widget.password.toString(),
    };

    final result = await API().postRequest(route: '/auth/login', data: data);

    final Response = jsonDecode(result.body);

    if (Response['status'] == 200) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setInt('user_id', Response['user']['id']);
      await preferences.setString('name', Response['user']['name']);
      await preferences.setString('email', Response['user']['email']);
      await preferences.setString('token', Response['token']);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        // content: Text(Response['message'] + (Response['token']).toString()),
        content:
            Text('Selamat Datang ' + (Response['user']['name']).toString()),
      ));
      print(data);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const ControllerPage()));
    } else {
      print('gagal login');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Akun Tidak Tersedia')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
          onPressed: () {
            // Action when the button is pressed
            loginUser();
            // Navigator.of(context).pushReplacement(
            //   MaterialPageRoute(builder: (context) => const ControllerPage()));
          },
          style: ElevatedButton.styleFrom(
            primary: Color.fromARGB(255, 121, 164, 233),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 6,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'Login',
              style: GoogleFonts.quicksand(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 19,
                ),
              ),
            ),
          )),
    );
  }
}
