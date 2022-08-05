import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Search Movies...';
  @override
  TextStyle? get searchFieldStyle =>
      GoogleFonts.lato(textStyle: const TextStyle(fontSize: 16));

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear_sharp),
        onPressed: () => query = '',
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new),
      onPressed: () => {
        close(
          context,
          null,
        )
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('Buil dResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      return const Center(
        child: Icon(
          Icons.movie_creation_outlined,
          color: Colors.black38,
          size: 120,
        ),
      );
    }

    return Text('Build Suggestions $query');
  }
}
