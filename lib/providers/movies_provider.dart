import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:movies/models/model.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = '72c3440db6b927508f12139e55f90a26';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'en-US';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  MoviesProvider() {
    print('Initial Provider');
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    final url = Uri.https(_baseUrl, '/3/movie/now_playing', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);

    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  //  Method for popular movies
  getPopularMovies() async {
    final url = Uri.https(_baseUrl, '/3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page': '1',
    });

    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);

    popularMovies = [...popularMovies, ...popularResponse.results];
    notifyListeners();
  }
}
