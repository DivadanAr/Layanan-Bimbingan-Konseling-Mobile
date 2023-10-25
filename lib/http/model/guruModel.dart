import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GuruModel {
  int? id;
  String? userId;
  String? nama;
  String? nipd;
  String? tanggalLahir;
  String? kelamin;
  String? telepon;
  String? createdAt;
  String? updatedAt;
}

Future<GuruModel> getGuru() async {
  SharedPreferences sp = await SharedPreferences.getInstance();

  GuruModel guru = GuruModel();

  int? id = sp.getInt('user_id') ?? 11;

  String urlLocal = "https://layanan.bimbingan.konseling.secondiary.com/api/guru/$id";

  var result = await http.get(Uri.parse(urlLocal));

  if (result.statusCode == 200) {
    print(id);
    var data = json.decode(result.body);

    guru.id = data['id'];
    guru.userId = data['user_id'];
    guru.nama = data['nama'];
    guru.nipd = data['nipd'];
    guru.tanggalLahir = data['tanggal_lahir'];
    guru.kelamin = data['kelamin'];
    guru.telepon = data['telepon'];
  }
  return guru;
}
