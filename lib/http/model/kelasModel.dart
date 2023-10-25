import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class KelasModel {
  int? id;
  String? nama;
  String? createdAt;
  String? updatedAt;
}

Future<KelasModel> getKelas() async {
  SharedPreferences sp = await SharedPreferences.getInstance();

  KelasModel kelas = KelasModel();

  int? id = sp.getInt('user_id') ?? 0;

  String urlLocal = "https://layanan.bimbingan.konseling.secondiary.com/api/kelas/$id";

  var result = await http.get(Uri.parse(urlLocal));

  if (result.statusCode == 200) {
    print(id);
    var data = json.decode(result.body);

    kelas.id = data['id'];
    kelas.nama = data['nama'];
  }
  return kelas;
}
