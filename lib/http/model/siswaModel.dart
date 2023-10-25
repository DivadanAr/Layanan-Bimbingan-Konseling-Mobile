import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SiswaModel {
  int? id;
  String? userId;
  String? nama;
  String? nisn;
  String? tanggalLahir;
  String? kelamin;
  String? kelasId;
  String? kelas;
  String? gurubk;
  String? telepon;
  String? createdAt;
  String? updatedAt;
}

Future<SiswaModel> getSiswa() async {
  SharedPreferences sp = await SharedPreferences.getInstance();

  SiswaModel siswa = SiswaModel();

  int? id = sp.getInt('user_id') ?? 0;

  String urlLocal = "https://layanan.bimbingan.konseling.secondiary.com/api/siswa/$id";

  var result = await http.get(Uri.parse(urlLocal));

  if (result.statusCode == 200) {

    var data = json.decode(result.body);

    siswa.id = data['id'];
    siswa.userId = data['user_id'];
    siswa.nama = data['nama'];
    siswa.nisn = data['nisn'];
    siswa.tanggalLahir = data['tanggal_lahir'];
    siswa.kelamin = data['kelamin'];
    siswa.kelasId = data['kelas_id'];
    siswa.kelas = data['kelas'];
    siswa.gurubk = data['guru_bk'];
    siswa.telepon = data['telepon'];
  }
  return siswa;
}

class NamaSiswa extends StatelessWidget {
  const NamaSiswa({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('nama nya');
  }
}