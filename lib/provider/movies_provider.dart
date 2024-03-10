import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/models.dart';

class MoviesProvider extends ChangeNotifier{

  final String _apiKey   = '7c8a0ecd56386c3d9910eb2ff50c6bb4';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies   = [];

  MoviesProvider(){
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async{
    var url = Uri.https('api.themoviedb.org','/3/movie/now_playing',{
      'api_key'  : _apiKey,
      'language' : _language,
      'page'     : '1'
    });
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async{
    var url = Uri.https('api.themoviedb.org','/3/movie/popular',{
      'api_key'  : _apiKey,
      'language' : _language,
      'page'     : '1'
    });
    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);

    popularMovies = [...popularMovies,...popularResponse.results];
    print(popularMovies[0]);
    notifyListeners();
  }
}