import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import "dart:convert";

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = "ee0fda4b27c94ea0fbe93b064b76b0b0";
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = "es-ES";

  List<dynamic> dataMovies = [];

 
  MoviesProvider(){
    this.getMovies();
  }

  getMovies() async{
    var url = Uri.https(_baseUrl,'/3/movie/now_playing',{
      'api_key':_apiKey,
    'language':_language,
    'page':'1'
    });

  final response = await http.get(url);
  if (response.statusCode == 200) {
    final Map<String, dynamic> jsonResponse = json.decode(response.body);
    print(jsonResponse);

    dataMovies = jsonResponse["results"];
    notifyListeners();



  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
  }
}