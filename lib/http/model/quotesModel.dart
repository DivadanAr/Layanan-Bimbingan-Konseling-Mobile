import 'package:http/http.dart' as http;
import 'dart:convert';

class QuotesModel {
  int? id;
  String? quotes;
  String? gurubk;
  String? createdAt;
  String? updatedAt;
}

Future<List<QuotesModel>> getQuotes() async {
  List<QuotesModel> quotess = [];

  String urlLocal = "https://layanan.bimbingan.konseling.secondiary.com/api/quotes";

  var result = await http.get(Uri.parse(urlLocal));

  if (result.statusCode == 200) {
    var data = json.decode(result.body);

    for (var item in data) {
      QuotesModel quotes = QuotesModel();

      quotes.id = item['id'];
      quotes.gurubk = item['guru_bk_id'];
      quotes.quotes = item['quotes'];

      quotess.add(quotes);
    }
  }

  return quotess;
}
