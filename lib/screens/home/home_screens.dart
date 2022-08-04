import 'package:flutter/material.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import 'package:movies/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/';

  static Route route<T>() {
    return MaterialPageRoute(
      builder: (_) => const HomeScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Movies',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          const CircleAvatarWidget(),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardSwiperWidget(movies: moviesProvider.onDisplayMovies),
            // list of movies
            MovieSliderWidget(
              title: 'Populares',
              movies: moviesProvider.popularMovies,
              onNextPage: () => moviesProvider.getPopularMovies(),
            ),
            // MovieSliderWidget(
            //   title: 'Tv populares',
            //   movies: moviesProvider.popularMovies,
            // ),
          ],
        ),
      ),
    );
  }
}
