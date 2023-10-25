import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:layananbk_flutter/http/api/api.dart';
import 'package:layananbk_flutter/http/controller/authController.dart';
import 'package:layananbk_flutter/page/controllerPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late Animation animation;
  late AnimationController animationController;

  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  // void loginUser(nama, passwor) async {
  //   final data = {
  //     'name': nameController.text.toString(),
  //     'password': passwordController.text.toString(),
  //   };

  //   final result = await API().postRequest(route: '/auth/login', data: data);

  //   final Response = jsonDecode(result.body);

  //   if (Response['status'] == 200) {
  //     SharedPreferences preferences = await SharedPreferences.getInstance();
  //     await preferences.setInt('user_id', Response['user']['id']);
  //     await preferences.setString('name', Response['user']['name']);
  //     await preferences.setString('email', Response['user']['email']);
  //     await preferences.setString('token', Response['token']);
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       // content: Text(Response['message'] + (Response['token']).toString()),
  //       content:
  //           Text('Selamat Datang ' + (Response['user']['name']).toString()),
  //     ));
  //     print(data);
  //     Navigator.of(context).pushReplacement(
  //         MaterialPageRoute(builder: (context) => const ControllerPage()));
  //   } else {
  //     print('gagal login');
  //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text('Akun Tidak Tersedia')),
  //     );
  //   }
  // }

  bool passwordVisible = false;
  // bool _isLoading = false;
  // bool _isChecked = false;

  void togglePasswordVisibility() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  @override
  void dispose() {
    // nameController.dispose();
    // passwordController.dispose();

    super.dispose();
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Transform(
              transform:
                  Matrix4.translationValues(0.0, animation.value * height, 0.0),
              child: Container(
                margin: EdgeInsets.all(25),
                child: Center(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 25),
                        child: Column(
                          children: [
                            Image.asset('assets/image/logoAuth.png',
                                height: 200),
                            SizedBox(height: 20),
                            Container(
                              width: double.maxFinite,
                              child: Text(
                                "Starbhak Counseling",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.quicksand(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 27),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              width: double.maxFinite,
                              child: Text(
                                "HI, Welcome back",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.quicksand(
                                  textStyle: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 19),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        width: double
                            .infinity, // Ubah dari double.maxFinite ke double.infinity
                        height: 62,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.17),
                              spreadRadius: 3,
                              blurRadius: 6,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.person,
                              size: 30,
                              color: Colors.black38,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Username',
                                    style: GoogleFonts.quicksand(
                                      textStyle: TextStyle(
                                          color: Colors.black38,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    child: SizedBox(
                                      height: 25,
                                      child: TextFormField(
                                        controller: nameController,
                                        style: GoogleFonts.quicksand(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17),
                                        ),
                                        cursorColor:
                                            Color.fromARGB(255, 121, 164, 233),
                                        decoration: InputDecoration(
                                            hintText: 'Enter Username..',
                                            hintStyle: GoogleFonts.quicksand(
                                              textStyle: TextStyle(
                                                  color: Colors.black12,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 17),
                                            ),
                                            contentPadding: EdgeInsets.only(
                                                top: 0, bottom: 11),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        width: double
                            .infinity, // Ubah dari double.maxFinite ke double.infinity
                        height: 62,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.17),
                              spreadRadius: 3,
                              blurRadius: 6,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.lock,
                              size: 30,
                              color: Colors.black38,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Password',
                                    style: GoogleFonts.quicksand(
                                      textStyle: TextStyle(
                                          color: Colors.black38,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    child: SizedBox(
                                      height: 25,
                                      child: TextFormField(
                                        controller: passwordController,
                                        obscureText: !passwordVisible,
                                        style: GoogleFonts.quicksand(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17),
                                        ),
                                        cursorColor:
                                            Color.fromARGB(255, 121, 164, 233),
                                        decoration: InputDecoration(
                                          hintText: 'Enter Password..',
                                          hintStyle: GoogleFonts.quicksand(
                                            textStyle: TextStyle(
                                                color: Colors.black12,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 17),
                                          ),
                                          contentPadding: EdgeInsets.only(
                                              top: 0, bottom: 11),
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10),
                            IconButton(
                              onPressed: togglePasswordVisibility,
                              icon: Icon(
                                passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      LoginButton(nama: nameController.text.toString(), password: passwordController.text.toString(),)
                    ],
                  ),
                )),
              ),
            );
          }),
    );
  }
}
