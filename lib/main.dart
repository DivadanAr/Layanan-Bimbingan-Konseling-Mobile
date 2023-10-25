import 'package:flutter/material.dart';
import 'package:layananbk_flutter/appTheme.dart';
import 'package:layananbk_flutter/http/controller/quotesController.dart';
import 'package:layananbk_flutter/http/controller/siswaController.dart';
import 'package:layananbk_flutter/http/model/siswaModel.dart';
import 'package:layananbk_flutter/page/controllerPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:layananbk_flutter/splashScreen/animationView.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await fetchDataAndRunApp();
}

Future<void> fetchDataAndRunApp() async {
  await QuotesListData.fetchDataQuotes();
  await SiswaData.fetchDataSiswa();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layanan Bk',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
      // home: ControllerPage()
      home: FutureBuilder(
          future: SharedPreferences.getInstance(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: Colors.blueAccent),
              );
            } else if (snapshot.hasError) {
              return Text('Something error');
            } else if (snapshot.hasData) {
              final token = snapshot.data!.getString('token');
              if (token != null) {
                return ControllerPage();
              } else {
                return IntroductionAnimationScreen();
              }
            } else {
              return IntroductionAnimationScreen();
            }
          }),
    );
  }
}
