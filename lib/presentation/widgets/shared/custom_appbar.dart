import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:cinemapedia/domain/entities/movie.dart';

import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:cinemapedia/presentation/providers/providers.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () {
        final searchedMovies = ref.read(searchedMoviesProvider);
        final searchQuery = ref.read(searchQueryProvider);

        showSearch<Movie?>(
          query: searchQuery,
          context: context,
          delegate: SearchMovieDelegate(
            initialMovies: searchedMovies,
            searchMovies:
                ref.read(searchedMoviesProvider.notifier).searchMoviesByQuery,
          ),
        ).then((movie) {
          if (movie == null) return;
          context.push('/home/0/movie/${movie.id}');
        });
      },
      icon: const Icon(Icons.search),
    );
  }
}
