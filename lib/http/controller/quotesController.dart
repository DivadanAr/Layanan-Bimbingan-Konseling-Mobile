import 'package:layananbk_flutter/http/model/quotesModel.dart';

class QuotesListData {
  QuotesListData({
    this.gurubk = '',
    this.quotes = '',
  });

  String gurubk;
  String quotes;

  static List<QuotesListData> quotesList = <QuotesListData>[];

  static Future<void> fetchDataQuotes() async {
    List<QuotesModel> quotesFromApi = await getQuotes();
    quotesList = quotesFromApi.map((quotes) {
      return QuotesListData(
        gurubk: quotes.gurubk ?? '',
        quotes: quotes.quotes ?? '',
      );
    }).toList();
  }

}
