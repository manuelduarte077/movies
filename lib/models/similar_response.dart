import 'dart:convert';

import 'package:movies/models/model.dart';

class SimilarResponse {
  SimilarResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory SimilarResponse.fromJson(String str) =>
      SimilarResponse.fromMap(json.decode(str));

  factory SimilarResponse.fromMap(Map<String, dynamic> json) => SimilarResponse(
        page: json['page'],
        results: List<Movie>.from(json['results'].map((x) => Movie.fromMap(x))),
        totalPages: json['total_pages'],
        totalResults: json['total_results'],
      );
}
