import 'package:flutter/material.dart';
import 'package:layananbk_flutter/http/model/quotesModel.dart';
import 'package:layananbk_flutter/http/model/siswaModel.dart';

class SiswaData {
  SiswaData({
    this.id = 0,
    this.userId = '',
    this.nama = '',
    this.nisn = '',
    this.tanggalLahir = '',
    this.kelamin = '',
    this.gurubk = '',
    this.kelasId = '',
    this.kelas = '',
    this.telepon = '',
  });

  int? id;
  String? userId;
  String? nama;
  String? nisn;
  String? tanggalLahir;
  String? kelamin;
  String? gurubk;
  String? kelasId;
  String? kelas;
  String? telepon;
  

  static Future<SiswaData> fetchDataSiswa() async {
    SiswaModel siswaFromApi = await getSiswa();
    return SiswaData(
      id: siswaFromApi.id ?? 0,
      nama: siswaFromApi.nama ?? '',
      nisn: siswaFromApi.nisn ?? '',
      tanggalLahir: siswaFromApi.tanggalLahir ?? '',
      kelamin: siswaFromApi.kelamin ?? '',
      gurubk: siswaFromApi.gurubk ?? '',
      kelas: siswaFromApi.kelas ?? '',
      kelasId: siswaFromApi.kelasId ?? '',
      telepon: siswaFromApi.telepon ?? '',
    );
  }
}

// import 'package:layananbk_flutter/appTheme.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class SiswaController extends StatelessWidget {
//   final int id;
//   final String userId;
//   final String nama;
//   final String nisn;
//   final String tanggalLahir;
//   final String kelamin;
//   final String kelasId;
//   final String kelas;
//   final String gurubk;
//   final String telepon;

//   const SiswaController(
//       {Key? key,
//       this.id = 0,
//       this.userId = '',
//       this.nama = '',
//       this.nisn = '',
//       this.tanggalLahir = '',
//       this.kelamin = '',
//       this.kelasId = '',
//       this.kelas = '',
//       this.gurubk = '',
//       this.telepon = ''})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: MyAppTheme.white,
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(8.0),
//             bottomLeft: Radius.circular(8.0),
//             bottomRight: Radius.circular(8.0),
//             topRight: Radius.circular(68.0)),
//         boxShadow: <BoxShadow>[
//           BoxShadow(
//               color: MyAppTheme.grey.withOpacity(0.2),
//               offset: Offset(1.1, 1.1),
//               blurRadius: 10.0),
//         ],
//       ),
//       child: Column(
//         children: <Widget>[
//           Padding(
//             padding:
//                 const EdgeInsets.only(top: 12, left: 16, right: 16),
//             child: Row(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(right: 10),
//                   child: Center(
//                       child: Image.asset(
//                     'assets/image/user.png',
//                     width: 100,
//                     height: 100,
//                   )),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                         left: 7, right: 8, top: 4),
//                     child: Column(
//                       children: <Widget>[
//                         Row(
//                           children: <Widget>[
//                             Container(
//                               width: 120,
//                               padding: const EdgeInsets.only(
//                                   right: 8, left: 0),
//                               child: Text(nama,
//                                       style: GoogleFonts.quicksand(
//                                           textStyle: TextStyle(
//                                               fontSize: 20,
//                                               fontWeight:
//                                                   FontWeight.w700)),
//                                     ),
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           height: 7,
//                         ),
//                         Row(
//                           children: <Widget>[
//                             Container(
//                               height: 48,
//                               width: 2,
//                               decoration: BoxDecoration(
//                                 color: HexColor('#87A0E5')
//                                     .withOpacity(0.5),
//                                 borderRadius: BorderRadius.all(
//                                     Radius.circular(4.0)),
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.center,
//                                 crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                 children: <Widget>[
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 4, bottom: 4),
//                                     child: Text(
//                                       'Your Teacher',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         fontFamily:
//                                             MyAppTheme.fontName,
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 16,
//                                         letterSpacing: -0.1,
//                                         color: MyAppTheme.grey
//                                             .withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 10, bottom: 3),
//                                     child: Text(
//                                       gurubk != ''
//                                           ? gurubk
//                                           : "Guru tidak tersedia.",
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         fontFamily:
//                                             MyAppTheme.fontName,
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: 13,
//                                         letterSpacing: -0.1,
//                                         color: MyAppTheme.grey
//                                             .withOpacity(0.5),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//                 left: 24, right: 24, top: 8, bottom: 8),
//             child: Container(
//               height: 2,
//               decoration: BoxDecoration(
//                 color: MyAppTheme.background,
//                 borderRadius:
//                     BorderRadius.all(Radius.circular(4.0)),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//                 left: 20, right: 20, top: 8, bottom: 16),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Text('Kelas',
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.quicksand(
//                             textStyle: TextStyle(
//                               fontFamily: MyAppTheme.fontName,
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                               letterSpacing: -0.2,
//                               color: MyAppTheme.darkText,
//                             ),
//                           )),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 6),
//                         child: Text(
//                             kelas != ''
//                                 ? kelas
//                                 : "Tidak Ada Kelas.",
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.quicksand(
//                               textStyle: TextStyle(
//                                 fontFamily: MyAppTheme.fontName,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 13,
//                                 color: MyAppTheme.grey
//                                     .withOpacity(0.5),
//                               ),
//                             )),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Text('Telepon',
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.quicksand(
//                             textStyle: TextStyle(
//                               fontFamily: MyAppTheme.fontName,
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                               letterSpacing: -0.2,
//                               color: MyAppTheme.darkText,
//                             ),
//                           )),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 6),
//                         child: Text(
//                             telepon != ''
//                                 ? telepon
//                                 : "Telepon tidak tersedia.",
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.quicksand(
//                               textStyle: TextStyle(
//                                 fontFamily: MyAppTheme.fontName,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 13,
//                                 color: MyAppTheme.grey
//                                     .withOpacity(0.5),
//                               ),
//                             )),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: <Widget>[
//                       Text('NISN',
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.quicksand(
//                             textStyle: TextStyle(
//                               fontFamily: MyAppTheme.fontName,
//                               fontWeight: FontWeight.w600,
//                               fontSize: 16,
//                               letterSpacing: -0.2,
//                               color: MyAppTheme.darkText,
//                             ),
//                           )),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 6),
//                         child: Text(
//                             nisn != ''
//                                 ? nisn
//                                 : "NISN tidak tersedia.",
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.quicksand(
//                               textStyle: TextStyle(
//                                 fontFamily: MyAppTheme.fontName,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 13,
//                                 color: MyAppTheme.grey
//                                     .withOpacity(0.5),
//                               ),
//                             )),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

