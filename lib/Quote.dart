import 'package:http/http.dart';
import 'dart:convert';
import 'dart:async';

class Quote{
  String q;
  String a;

  Future<void> getQuote() async{
    try{
      var url = Uri.parse('https://zenquotes.io/api/random');
      Response response = await get(url);
      List data = jsonDecode(response.body);
      String quote = data.first.toString();
      int i = quote.indexOf("h:");
      quote = quote.substring(4,i-2);
      q = quote.substring(0,quote.indexOf(', a:'));
      a = quote.substring(quote.indexOf(', a:'));
      a = a.replaceFirst(', a:', '-');
    } catch(e){
      q = 'Error: $e';
    }
  }

}