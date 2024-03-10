import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier{

  final String _apiKey   = '7c8a0ecd56386c3d9910eb2ff50c6bb4';
  final String _baseUrl  = 'api.themoviedb.org';
  final String _language = 'es-ES';

  MoviesProvider(){
    print('MoviesProvider inicializado');
    getOnDisplayMovies();
  }

  getOnDisplayMovies() async{
    print('MoviesProvider en inicio de getOmDisplayMovies');
    var url = Uri.https('api.themoviedb.org','/3/movie/now_playing',{
      'api_key' : _apiKey,
      'language' : _language
    });
    print('MoviesProvider antes de peticion');
    final response = await http.get(url);
    final Map<String,dynamic> decodedData =json.decode(response.body);
    print('MoviesProvider despues de peticion');
    print('MoviesProvider respuesta peticion:');
    print(decodedData['results']);
  }
}