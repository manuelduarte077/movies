import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Search Movies...';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      const Text('Build Actions'),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return const Icon(
      Icons.search_rounded,
      size: 26,
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('Buil dResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text('Build Suggestions $query');
  }
}
